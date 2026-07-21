#!/usr/bin/env python3
"""
游戏物品数据提取工具 — Game Item Data Extractor
===============================================
基于 Playwright 在游戏运行时通过 JavaScript Hook 提取客户端内存中的物品配置表。

核心思路：
  游戏使用 Egret 引擎 + 二进制 WebSocket 协议。
  物品配置数据在浏览器端以 JSON 对象形式存在于内存中。
  通过加装 Hook 拦截数据加载管道，在游戏运行时从内存中提取配置表。

提取策略：
  A. 拦截 Egret 资源加载器 — 在数据解析为 JS 对象前截获
  B. 深度扫描全局变量空间 — 遍历 window 及 game 命名空间
  C. 拦截 WebSocket 二进制消息 — 解析协议头识别协议ID
  D. 定期采样内存对象 — 持续监控数据变化
"""

from __future__ import annotations

import asyncio
import json
import os
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path

# ═══════════════════════════════════════════════════════════════
#  配置
# ═══════════════════════════════════════════════════════════════

TARGET_URL = (
    "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
)
BASE_DIR = Path(__file__).parent.resolve()
DATA_DIR = BASE_DIR / "data" / "extracted"
VENV_DIR = BASE_DIR / ".venv"

VIEWPORT_WIDTH = 500
VIEWPORT_HEIGHT = 800
DEVICE_SCALE_FACTOR = 3.33

# 首次加载等待（秒）
WAIT_FOR_GAME_LOAD = 35
# 保存间隔（秒）
SAVE_INTERVAL = 30

# ═══════════════════════════════════════════════════════════════
#  JavaScript Hook 脚本
# ═══════════════════════════════════════════════════════════════

JS_HOOK_SCRIPT = r"""
(function() {
    // ---- 全局存储 ----
    window.__extractedData = {
        items: [],            // 物品配置 [{id, name, icon, type, quality}]
        itemNames: new Set(), // 去重物品名
        itemNameMap: {},      // id → name
        itemIconMap: {},      // id → icon
        resGetRes: [],        // RES.getRes 拦截日志
        globalHits: [],       // 全局扫描命中
        protocols: [],        // WebSocket 二进制协议摘要
        bagData: null,        // 最后捕获到的背包响应
        gameConfigs: {},      // 深度扫描到的配置表
        foundKeys: new Set(), // 已发现的 key（去重用）
    };

    const D = window.__extractedData;
    D._log = [];
    function log(m) { D._log.push('['+new Date().toISOString()+'] '+m); if(D._log.length>1000)D._log.shift(); }

    // ========================================================
    // 策略 A: 精确拦截 Egret 资源加载器
    // ========================================================
    function hookEgretLoader() {
        try {
            // 尝试拦截 RES 模块
            var resMod = null;
            // 方式1: window.RES
            if (window.RES && window.RES.getResByUrl) resMod = window.RES;
            // 方式2: 扫描 egret 命名空间
            if (!resMod && window.egret) {
                for (var k in window.egret) {
                    var v = window.egret[k];
                    if (v && typeof v.getResByUrl === 'function') { resMod = v; break; }
                    if (v && typeof v.getRes === 'function') { resMod = v; break; }
                }
            }
            // 方式3: 扫描全局属性
            if (!resMod) {
                for (var k in window) {
                    try {
                        var v = window[k];
                        if (v && typeof v.getResByUrl === 'function') { resMod = v; break; }
                    } catch(e) {}
                }
            }

            if (!resMod) { log('RES module not found'); return false; }

            log('RES module found: ' + (resMod.name || resMod.constructor.name || 'unknown'));

            // --- Hook getResByUrl (原始数据加载) ---
            if (resMod.getResByUrl) {
                var orig = resMod.getResByUrl;
                resMod.getResByUrl = function(url, compFunc, thisObject, param) {
                    var result = orig.call(this, url, compFunc, thisObject, param);
                    try {
                        if (url && typeof url === 'string') {
                            var key = url.split('/').pop();
                            log('getResByUrl: ' + key);
                            D.resGetRes.push({ type: 'url', key: key, url: url, time: Date.now() });
                        }
                    } catch(e) {}
                    return result;
                };
                log('getResByUrl hooked');
            }

            // --- Hook getRes (按名称加载) ---
            if (resMod.getRes) {
                var origGetRes = resMod.getRes;
                resMod.getRes = function(key) {
                    var result = origGetRes.apply(this, arguments);
                    try {
                        if (key && typeof key === 'string') {
                            D.resGetRes.push({ type: 'key', key: key, time: Date.now() });
                            log('getRes: ' + key);
                            // 分析返回值
                            if (result !== null && result !== undefined) {
                                try {
                                    var snap = JSON.parse(JSON.stringify(result));
                                    D.resGetRes.push({ type: 'key_val', key: key, val: snap, time: Date.now() });
                                    analyzeData(snap, 'RES:' + key);
                                } catch(e) {}
                            }
                        }
                    } catch(e) {}
                    return result;
                };
                log('getRes hooked');
            }
            return true;
        } catch(e) { log('hookEgretLoader: ' + e.message); return false; }
    }

    // ========================================================
    // 策略 B: 深度扫描全局对象
    // ========================================================
    function deepScan() {
        var scanResults = [];
        var scanned = new WeakSet();

        function isItemData(obj) {
            if (!obj || typeof obj !== 'object') return false;
            // 检查是否有 id 和 name
            if (obj.id !== undefined && obj.name !== undefined) return true;
            // 检查是否有 itemId
            if (obj.itemId !== undefined) return true;
            return false;
        }

        function scanObj(obj, path, depth) {
            if (depth > 4) return;
            if (!obj || typeof obj !== 'object') return;
            try { if (scanned.has(obj)) return; scanned.add(obj); } catch(e) { return; }

            var keys = null;
            try { keys = Object.keys(obj); } catch(e) { return; }
            if (!keys || keys.length === 0) return;

            // 检查是否是一组物品配置 (对象格式: {id: {name, icon, ...}})
            if (keys.length >= 2 && keys.length <= 5000) {
                var sample = obj[keys[0]];
                if (sample && typeof sample === 'object' && !Array.isArray(sample) && sample.name) {
                    var items = [];
                    for (var i = 0; i < keys.length; i++) {
                        var k = keys[i];
                        var v = obj[k];
                        if (v && v.name) {
                            items.push({ id: k, name: v.name, icon: v.icon, type: v.type, quality: v.quality });
                            D.itemNames.add(v.name);
                            D.itemNameMap[k] = v.name;
                            if (v.icon !== undefined) D.itemIconMap[k] = v.icon;
                        }
                    }
                    if (items.length > 5) {
                        log('SCAN: found ' + items.length + ' items at ' + path);
                        D.globalHits.push({ path: path, count: items.length, items: items.slice(0, 100) });
                        for (var ii = 0; ii < items.length; ii++) D.items.push(items[ii]);
                        return;
                    }
                }
            }

            // 检查是否是数组格式的物品配置
            if (Array.isArray(obj) && obj.length > 0 && obj.length < 5000) {
                var itemCount = 0;
                for (var i = 0; i < obj.length; i++) {
                    if (isItemData(obj[i])) {
                        itemCount++;
                        var item = obj[i];
                        var id = item.id !== undefined ? item.id : item.itemId;
                        var entry = { id: id, _source: path };
                        if (item.name) { entry.name = item.name; D.itemNames.add(item.name); D.itemNameMap[id] = item.name; }
                        if (item.icon !== undefined) { entry.icon = item.icon; D.itemIconMap[id] = item.icon; }
                        if (item.type !== undefined) entry.type = item.type;
                        if (item.quality !== undefined) entry.quality = item.quality;
                        D.items.push(entry);
                    }
                }
                if (itemCount > 5) {
                    log('SCAN: found ' + itemCount + ' items in array at ' + path);
                    D.globalHits.push({ path: path, count: itemCount, type: 'array' });
                }
            }

            // 递归扫描子对象
            if (depth < 3) {
                for (var i = 0; i < Math.min(keys.length, 200); i++) {
                    try {
                        var v = obj[keys[i]];
                        if (v && typeof v === 'object' && !(v instanceof Node) && !(v instanceof Window) && !ArrayBuffer.isView(v)) {
                            scanObj(v, path + '.' + keys[i], depth + 1);
                        }
                    } catch(e) {}
                }
            }
        }

        // 扫描 window 主要属性
        log('Starting deep scan...');
        var winKeys = Object.keys(window).sort();
        for (var i = 0; i < Math.min(winKeys.length, 500); i++) {
            try {
                var k = winKeys[i];
                // 跳过已知无用的
                if (k === 'window' || k === 'self' || k === 'top' || k === 'parent' || k === 'document' || k === 'frames' || k === 'location' || k === 'navigator' || k === 'localStorage' || k === 'sessionStorage') continue;
                var v = window[k];
                if (v && typeof v === 'object' && !(v instanceof Node) && !ArrayBuffer.isView(v)) {
                    scanObj(v, k, 0);
                }
            } catch(e) {}
        }
        log('Deep scan complete');
    }

    // ========================================================
    // 数据分析器
    // ========================================================
    function analyzeData(data, source) {
        if (!data) return;
        try {
            if (Array.isArray(data)) {
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    if (typeof item === 'string') {
                        try { item = JSON.parse(item); } catch(e) { continue; }
                    }
                    if (item && typeof item === 'object') {
                        var id = item.id !== undefined ? item.id : (item.itemId !== undefined ? item.itemId : null);
                        if (id !== null) {
                            var entry = { id: id, _source: source };
                            if (item.name) { entry.name = item.name; D.itemNames.add(item.name); D.itemNameMap[id] = item.name; }
                            if (item.icon !== undefined) { entry.icon = item.icon; D.itemIconMap[id] = item.icon; }
                            if (item.type !== undefined) entry.type = item.type;
                            if (item.quality !== undefined) entry.quality = item.quality;
                            if (item.key) entry.key = item.key;
                            // 嵌套 value
                            if (item.value && typeof item.value === 'object' && item.value.name) {
                                var v = item.value;
                                if (!entry.name) { entry.name = v.name; D.itemNames.add(v.name); D.itemNameMap[id] = v.name; }
                                if (entry.icon === undefined && v.icon !== undefined) { entry.icon = v.icon; D.itemIconMap[id] = v.icon; }
                            }
                            D.items.push(entry);
                        }
                    }
                }
                if (data.length > 0) log('analyzeData: ' + data.length + ' items from ' + source);
            } else if (typeof data === 'object') {
                var keys = Object.keys(data);
                for (var i = 0; i < keys.length; i++) {
                    var k = keys[i];
                    var v = data[k];
                    if (v && typeof v === 'object' && v.name) {
                        D.items.push({ id: k, name: v.name, icon: v.icon, type: v.type, quality: v.quality, _source: source });
                        D.itemNames.add(v.name);
                        D.itemNameMap[k] = v.name;
                        if (v.icon !== undefined) D.itemIconMap[k] = v.icon;
                    }
                }
                if (keys.length > 0) log('analyzeData: scanned ' + keys.length + ' keys from ' + source);
            }
        } catch(e) { log('analyzeData error: ' + e.message); }
    }

    // ========================================================
    // 策略 C: 拦截 WebSocket 二进制消息
    // ========================================================
    function hookWebSocket() {
        try {
            var OrigWS = window.WebSocket;
            var origSend = OrigWS.prototype.send;

            // Hook send
            OrigWS.prototype.send = function(data) {
                try {
                    var entry = { dir: 'send', time: Date.now() };
                    if (typeof data === 'string') {
                        entry.size = data.length;
                        entry.encoding = 'text';
                        try { entry.json = JSON.parse(data); } catch(e) { entry.raw = data.substring(0, 100); }
                    } else if (data instanceof ArrayBuffer) {
                        entry.size = data.byteLength;
                        entry.encoding = 'binary';
                        // 读取协议头 (前4字节: 2字节长度 + 2字节协议ID)
                        if (data.byteLength >= 4) {
                            var view = new DataView(data);
                            entry.msgLen = view.getUint16(0, true);
                            entry.cmd = view.getUint16(2, true);
                            if (entry.cmd) log('WS send cmd=' + entry.cmd);
                        }
                    } else if (data && data.byteLength !== undefined) {
                        entry.size = data.byteLength;
                        entry.encoding = 'binary-view';
                        if (data.byteLength >= 4) {
                            try {
                                var buf = data.buffer ? data.buffer : data;
                                var view = new DataView(buf, data.byteOffset, data.byteLength);
                                entry.msgLen = view.getUint16(0, true);
                                entry.cmd = view.getUint16(2, true);
                                if (entry.cmd) log('WS send cmd=' + entry.cmd);
                            } catch(e) {}
                        }
                    }
                    D.protocols.push(entry);
                } catch(e) {}
                return origSend.apply(this, arguments);
            };

            // Hook onmessage / addEventListener
            var origAddEventListener = OrigWS.prototype.addEventListener;
            if (origAddEventListener) {
                OrigWS.prototype.addEventListener = function(type, listener, options) {
                    if (type === 'message') {
                        var wrapped = function(event) {
                            try {
                                var data = event.data;
                                var entry = { dir: 'recv', time: Date.now() };
                                if (typeof data === 'string') {
                                    entry.size = data.length;
                                    entry.encoding = 'text';
                                    try { entry.json = JSON.parse(data); } catch(e) { entry.raw = data.substring(0, 100); }
                                } else if (data instanceof ArrayBuffer) {
                                    entry.size = data.byteLength;
                                    entry.encoding = 'binary';
                                    if (data.byteLength >= 4) {
                                        var view = new DataView(data);
                                        entry.msgLen = view.getUint16(0, true);
                                        entry.cmd = view.getUint16(2, true);
                                        if (entry.cmd === 1301) { log('WS recv BAG cmd=1301'); D.bagData = { cmd:1301, rawSize:data.byteLength }; }
                                        else if (entry.cmd === 1701) { log('WS recv SHOP cmd=1701'); D.bagData = { cmd:1701, rawSize:data.byteLength }; }
                                        else if (entry.cmd) log('WS recv cmd=' + entry.cmd);
                                    }
                                } else if (data && data.byteLength !== undefined) {
                                    entry.size = data.byteLength;
                                    entry.encoding = 'blob';
                                    try {
                                        var buf = data.buffer ? data.buffer : data;
                                        var view = new DataView(buf, data.byteOffset, data.byteLength);
                                        if (data.byteLength >= 4) {
                                            entry.msgLen = view.getUint16(0, true);
                                            entry.cmd = view.getUint16(2, true);
                                            if (entry.cmd) log('WS recv cmd=' + entry.cmd);
                                        }
                                    } catch(e) {}
                                }
                                D.protocols.push(entry);
                            } catch(e) {}
                            return listener.apply(this, arguments);
                        };
                        return origAddEventListener.call(this, type, wrapped, options);
                    }
                    return origAddEventListener.apply(this, arguments);
                };
                log('WS addEventListener hooked');
            } else {
                // fallback: defineProperty on onmessage
                try {
                    var desc = Object.getOwnPropertyDescriptor(OrigWS.prototype, 'onmessage');
                    if (desc && desc.configurable) {
                        Object.defineProperty(OrigWS.prototype, 'onmessage', {
                            configurable: true,
                            enumerable: true,
                            get: function() { return this.__onmsg; },
                            set: function(fn) {
                                var self = this;
                                this.__onmsg = function(event) {
                                    try {
                                        var data = event.data;
                                        var entry = { dir: 'recv', time: Date.now() };
                                        if (typeof data === 'string') {
                                            entry.size = data.length;
                                            try { entry.json = JSON.parse(data); } catch(e) { entry.raw = data.substring(0,100); }
                                        } else if (data instanceof ArrayBuffer && data.byteLength >= 4) {
                                            entry.size = data.byteLength;
                                            var view = new DataView(data);
                                            entry.cmd = view.getUint16(2, true);
                                        }
                                        D.protocols.push(entry);
                                    } catch(e) {}
                                    return fn.apply(this, arguments);
                                };
                            }
                        });
                        log('WS onmessage hooked (defineProperty)');
                    }
                } catch(e) { log('WS hook fallback failed: ' + e.message); }
            }
            log('WebSocket hooked');
        } catch(e) { log('hookWebSocket error: ' + e.message); }
    }

    // ========================================================
    // 主入口 — 分层执行
    // ========================================================
    function main() {
        log('=== Item Extractor Started ===');

        // 阶段1: 立即 Hook
        hookWebSocket();
        hookEgretLoader();

        // 阶段2: 延迟扫描 (等待游戏加载)
        setTimeout(function() {
            log('--- Phase 2 ---');
            deepScan();
            // 再次尝试 Hook RES
            if (typeof window.RES === 'undefined') {
                hookEgretLoader();
            }
        }, 3000);

        // 阶段3: 深度扫描 (游戏已加载大部分资源)
        setTimeout(function() {
            log('--- Phase 3 ---');
            deepScan();
            // 扫描 game 相关命名空间
            if (window.gg) try { deepScanAt(window.gg, 'gg'); } catch(e) {}
            if (window.gs) try { deepScanAt(window.gs, 'gs'); } catch(e) {}
            if (window.go) try { deepScanAt(window.go, 'go'); } catch(e) {}
        }, 8000);

        // 阶段4: 最终扫描 (完全加载)
        setTimeout(function() {
            log('--- Phase 4 ---');
            deepScan();
            // 尝试拦截游戏数据管理器
            if (window.gg) {
                try {
                    // 尝试获取 gg 下所有可用的数据
                    for (var k in window.gg) {
                        try {
                            var v = window.gg[k];
                            if (v && typeof v === 'object' && !Array.isArray(v)) {
                                var keys = Object.keys(v);
                                if (keys.length > 5 && keys.length < 5000) {
                                    analyzeData(v, 'gg.' + k);
                                }
                            }
                        } catch(e) {}
                    }
                } catch(e) { log('gg scan error: ' + e.message); }
            }
            log('=== Extractor Initialized ===');
        }, 15000);
    }

    // 辅助函数: 在指定路径深度扫描
    function deepScanAt(obj, path) {
        if (!obj || typeof obj !== 'object') return;
        try {
            var keys = Object.keys(obj);
            for (var i = 0; i < Math.min(keys.length, 100); i++) {
                try {
                    var k = keys[i];
                    var v = obj[k];
                    if (v && typeof v === 'object') {
                        if (Array.isArray(v) && v.length > 0 && v.length < 5000) {
                            var itemCount = 0;
                            for (var j = 0; j < v.length; j++) {
                                if (v[j] && v[j].id !== undefined && v[j].name !== undefined) {
                                    itemCount++;
                                    var id = v[j].id;
                                    D.items.push({ id: id, name: v[j].name, icon: v[j].icon, type: v[j].type, quality: v[j].quality, _source: path + '.' + k });
                                    D.itemNames.add(v[j].name);
                                    D.itemNameMap[id] = v[j].name;
                                    if (v[j].icon !== undefined) D.itemIconMap[id] = v[j].icon;
                                }
                            }
                            if (itemCount > 3) log('deepScanAt: ' + itemCount + ' items at ' + path + '.' + k);
                        }
                    }
                } catch(e) {}
            }
        } catch(e) {}
    }

    // 页面加载后启动
    if (document.readyState === 'complete') main();
    else window.addEventListener('load', main);
})();
"""


# ═══════════════════════════════════════════════════════════════
#  工具函数
# ═══════════════════════════════════════════════════════════════

def format_size(n: int) -> str:
    if n >= 1024 * 1024:
        return f"{n / 1024 / 1024:.1f} MB"
    if n >= 1024:
        return f"{n / 1024:.1f} KB"
    return f"{n} B"


def ensure_venv() -> None:
    if sys.prefix != sys.base_prefix:
        try:
            import playwright  # noqa: F401
        except ImportError:
            print("[setup] 安装 playwright ...")
            subprocess.run([sys.executable, "-m", "pip", "install", "playwright"], check=True)
            subprocess.run([sys.executable, "-m", "playwright", "install", "chromium"], check=True)
        return

    print("[setup] 检测到未在虚拟环境中运行。")
    if not VENV_DIR.exists():
        print("[setup] 创建虚拟环境 ...")
        subprocess.run([sys.executable, "-m", "venv", str(VENV_DIR)], check=True)

    python_exe = VENV_DIR / "Scripts" / "python.exe"
    pip_exe = VENV_DIR / "Scripts" / "pip.exe"

    r = subprocess.run([str(python_exe), "-c", "import playwright"], capture_output=True, text=True)
    if r.returncode != 0:
        print("[setup] 安装 playwright ...")
        subprocess.run([str(pip_exe), "install", "playwright"], check=True)
        subprocess.run([str(python_exe), "-m", "playwright", "install", "chromium"], check=True)

    print("[setup] 在虚拟环境中重新启动脚本 ...")
    sys.stdout.flush()
    subprocess.run([str(python_exe)] + sys.argv)
    sys.exit(0)


# ═══════════════════════════════════════════════════════════════
#  提取核心
# ═══════════════════════════════════════════════════════════════

async def save_extracted_data(page, stats: dict) -> bool:
    """从页面提取数据并保存，返回是否成功。"""
    try:
        extract_result = await page.evaluate("""
            (function() {
                var d = window.__extractedData;
                if (!d) return { error: 'No data' };
                var names = [];
                d.itemNames.forEach(function(n) { names.push(n); });
                return {
                    items: d.items || [],
                    itemNames: names,
                    itemNameMap: d.itemNameMap || {},
                    itemIconMap: d.itemIconMap || {},
                    resGetRes: d.resGetRes || [],
                    globalHits: d.globalHits || [],
                    protocols: d.protocols || [],
                    bagData: d.bagData || null,
                    log: d._log || []
                };
            })()
        """)
    except Exception as e:
        print(f"  [!] 提取失败: {e}")
        return False

    if not extract_result:
        return False

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    items = extract_result.get("items", [])
    names = extract_result.get("itemNames", [])
    name_map = extract_result.get("itemNameMap", {})
    icon_map = extract_result.get("itemIconMap", {})
    res_data = extract_result.get("resGetRes", [])
    hits = extract_result.get("globalHits", [])
    protocols = extract_result.get("protocols", [])
    bag_data = extract_result.get("bagData")
    log_data = extract_result.get("log", [])

    # 保存文件
    if items:
        fp = DATA_DIR / f"items_{timestamp}.json"
        fp.write_text(json.dumps(items, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] 物品配置: {fp.name} ({len(items)} 条)")

    if name_map:
        fp = DATA_DIR / f"item_name_map_{timestamp}.json"
        fp.write_text(json.dumps(name_map, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] 物品名称映射: {fp.name} ({len(name_map)} 条)")

    if icon_map:
        fp = DATA_DIR / f"item_icon_map_{timestamp}.json"
        fp.write_text(json.dumps(icon_map, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] 物品图标映射: {fp.name} ({len(icon_map)} 条)")

    if names:
        fp = DATA_DIR / f"item_names_{timestamp}.txt"
        fp.write_text("\n".join(sorted(names)), encoding="utf-8")
        print(f"  [SAVED] 物品名称列表: {fp.name} ({len(names)} 个)")

    if res_data:
        fp = DATA_DIR / f"res_getres_{timestamp}.json"
        fp.write_text(json.dumps(res_data, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] RES.getRes 数据: {fp.name} ({len(res_data)} 条)")

    if hits:
        fp = DATA_DIR / f"global_hits_{timestamp}.json"
        fp.write_text(json.dumps(hits, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] 全局扫描命中: {fp.name}")

    if protocols:
        # 只保存最后保存时的增量
        fp = DATA_DIR / f"protocols_{timestamp}.json"
        fp.write_text(json.dumps(protocols, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] WebSocket 数据: {fp.name} ({len(protocols)} 条)")

    if bag_data:
        fp = DATA_DIR / f"bag_data_{timestamp}.json"
        fp.write_text(json.dumps(bag_data, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"  [SAVED] 背包协议数据: {fp.name}")

    if log_data:
        fp = DATA_DIR / f"hook_log_{timestamp}.txt"
        fp.write_text("\n".join(log_data), encoding="utf-8")
        print(f"  [SAVED] Hook 日志: {fp.name} ({len(log_data)} 行)")

    # 汇总报告
    report = {
        "timestamp": timestamp,
        "items": len(items),
        "names": len(names),
        "name_map": len(name_map),
        "icon_map": len(icon_map),
        "res_entries": len(res_data),
        "global_hits": len(hits),
        "protocols": len(protocols),
        "bag_data": bool(bag_data),
    }
    fp = DATA_DIR / f"report_{timestamp}.json"
    fp.write_text(json.dumps(report, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"  [SAVED] 报告: {fp.name}")

    # 更新统计
    stats["items_found"] = len(items)
    stats["names_found"] = len(names)
    stats["protocols_captured"] = len(protocols)

    # 控制台摘要
    print(f"\n  >>> 物品: {len(items)} | 名称: {len(names)} | 映射: {len(name_map)} | WS: {len(protocols)} | 背包: {'✓' if bag_data else '✗'}")

    if names:
        print(f"  前10个名称: {', '.join(sorted(names)[:10])}")
    if name_map:
        sorted_items = sorted(name_map.items(), key=lambda x: int(x[0]) if str(x[0]).isdigit() else 0)
        print(f"  前10个映射: {', '.join([f'{k}→{v}' for k,v in sorted_items[:10]])}")

    return True


async def extract() -> dict:
    stats = {
        "items_found": 0,
        "names_found": 0,
        "protocols_captured": 0,
        "start_time": time.time(),
    }

    (DATA_DIR).mkdir(parents=True, exist_ok=True)

    from playwright.async_api import async_playwright

    async with async_playwright() as pw:
        print("[*] 启动 Chrome 浏览器 (500x800, DPI 320) ...")

        launch_opts = {
            "headless": False,
            "args": [
                f"--window-size={VIEWPORT_WIDTH},{int(VIEWPORT_HEIGHT * 1.1)}",
                "--disable-blink-features=AutomationControlled",
            ],
        }

        try:
            browser = await pw.chromium.launch(channel="chrome", **launch_opts)
        except Exception:
            print("[*] 未找到系统 Chrome，使用 Playwright 内置 Chromium ...")
            browser = await pw.chromium.launch(**launch_opts)

        context = None
        page = None
        try:
            context = await browser.new_context(
                viewport={"width": VIEWPORT_WIDTH, "height": VIEWPORT_HEIGHT},
                device_scale_factor=DEVICE_SCALE_FACTOR,
                ignore_https_errors=True,
            )

            page = await context.new_page()

            # 注入 Hook 脚本
            await page.add_init_script(JS_HOOK_SCRIPT)

            # 导航到游戏
            print(f"\n[*] 正在加载游戏: {TARGET_URL}")
            print(f"[*] 等待游戏加载（最长 {WAIT_FOR_GAME_LOAD} 秒）...\n")

            try:
                await page.goto(
                    TARGET_URL,
                    wait_until="domcontentloaded",
                    timeout=WAIT_FOR_GAME_LOAD * 1000,
                )
            except Exception as e:
                print(f"[!] 页面加载提示: {e}")

            # 等待游戏初始化
            print(f"[*] 等待游戏引擎初始化（{WAIT_FOR_GAME_LOAD} 秒）...")
            await asyncio.sleep(WAIT_FOR_GAME_LOAD)

            # 首次提取
            print("\n[*] 首次提取...")
            ok = await save_extracted_data(page, stats)
            if not ok:
                print("[!] 首次提取失败，等待后重试...")
                await asyncio.sleep(10)
                await save_extracted_data(page, stats)

            # 持续捕获模式
            print("\n" + "=" * 60)
            print("  持续捕获模式 — 每 30 秒保存一次")
            print("  在游戏内操作（打开背包/商城等）以触发数据加载")
            print("  按 Ctrl+C 停止")
            print("=" * 60)

            while True:
                try:
                    await asyncio.sleep(SAVE_INTERVAL)
                    # 检查页面是否还活着
                    try:
                        await page.evaluate("1")
                    except Exception:
                        print("[!] 页面已关闭，停止捕获")
                        break

                    print(f"\n[*] 定时保存 ({datetime.now().strftime('%H:%M:%S')})...")
                    await save_extracted_data(page, stats)

                except asyncio.CancelledError:
                    raise
                except Exception as e:
                    print(f"  [!] 保存异常: {e}")
                    # 尝试重新连接
                    try:
                        await page.evaluate("1")
                    except Exception:
                        print("[!] 页面不可用，停止捕获")
                        break

        except asyncio.CancelledError:
            print("\n[!] 用户中断")
        except Exception as e:
            print(f"\n[!] 异常: {e}")
            import traceback
            traceback.print_exc()
        finally:
            # 最终保存
            if page:
                try:
                    print("\n[*] 最终保存...")
                    await save_extracted_data(page, stats)
                except Exception:
                    pass
            # 关闭浏览器
            try:
                await browser.close()
            except Exception:
                pass

    stats["elapsed"] = time.time() - stats["start_time"]
    return stats


# ═══════════════════════════════════════════════════════════════
#  入口
# ═══════════════════════════════════════════════════════════════

async def main() -> None:
    print("=" * 62)
    print("   游戏物品数据提取工具  —  Item Data Extractor")
    print("=" * 62)
    print(f"   目标: {TARGET_URL}")
    print(f"   输出: {DATA_DIR}")
    print(f"   窗口: {VIEWPORT_WIDTH}×{VIEWPORT_HEIGHT}  DPI 320")
    print("=" * 62)
    print()
    print("  提取策略:")
    print("  A. 拦截 Egret 资源加载器 (getRes/getResByUrl)")
    print("  B. 深度扫描 window 全局变量空间")
    print("  C. 拦截 WebSocket 二进制消息 (解析协议头)")
    print("  D. 定时采样内存对象")
    print()
    print("  运行模式: 持续捕获模式（按 Ctrl+C 停止）")
    print()

    stats: dict = {}

    try:
        stats = await extract()
    except Exception:
        print("\n[!] 提取过程异常:")
        import traceback
        traceback.print_exc()

    elapsed = stats.get("elapsed", 0)
    print(f"\n[*] 总运行时间: {elapsed:.1f} 秒")
    print(f"[*] 数据保存在: {DATA_DIR}")


if __name__ == "__main__":
    ensure_venv()

    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n[!] 用户中断，已退出。")
    except Exception as e:
        print(f"\n[!] 未预期错误: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)