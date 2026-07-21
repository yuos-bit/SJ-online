#!/usr/bin/env python3
"""
游戏数据抓取工具 — Game Data Capture Tool
============================================
分析并抓取网页游戏 (sjh5cdn2) 的所有网络数据和资源文件。

工作流程：
  1. 自动检查 Python 虚拟环境，缺失则创建并安装依赖
  2. 启动 Chrome 浏览器 (500x800, DPI 320)
  3. 实时捕获所有 HTTP 响应，按文件类型分类存入 data/
  4. 所有数据实时写入磁盘，不做内存缓存
  5. 按 Ctrl+C 停止，输出统计摘要并更新 README.md
"""

from __future__ import annotations

import asyncio
import hashlib
import json
import mimetypes
import os
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path
from urllib.parse import urlparse, unquote

# ═══════════════════════════════════════════════════════════════
#  配置
# ═══════════════════════════════════════════════════════════════

TARGET_URL = (
    "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
)
BASE_DIR = Path(__file__).parent.resolve()
DATA_DIR = BASE_DIR / "data"
VENV_DIR = BASE_DIR / ".venv"
SCRIPT_HASH_FILE = BASE_DIR / ".script_hash"

# ── 窗口 / 视口设置 ──────────────────────────────────────────
VIEWPORT_WIDTH = 500
VIEWPORT_HEIGHT = 800
# DPI 320 ≈ device-scale-factor 3.33 (标准 96 DPI → 320/96)
DEVICE_SCALE_FACTOR = 3.33

# ═══════════════════════════════════════════════════════════════
#  文件类型分类规则
# ═══════════════════════════════════════════════════════════════

# 后缀名 → 类别
EXT_CATEGORIES: dict[str, list[str]] = {
    "images":    [".png", ".jpg", ".jpeg", ".gif", ".svg", ".webp", ".ico", ".bmp", ".avif"],
    "scripts":   [".js", ".ts", ".jsx", ".tsx", ".mjs", ".cjs"],
    "styles":    [".css", ".scss", ".less", ".sass"],
    "html":      [".html", ".htm", ".xhtml"],
    "fonts":     [".woff", ".woff2", ".ttf", ".otf", ".eot"],
    "json":      [".json", ".jsonp", ".map"],
    "audio":     [".mp3", ".wav", ".ogg", ".aac", ".m4a", ".wma", ".flac"],
    "video":     [".mp4", ".webm", ".avi", ".mov", ".mkv"],
    "wasm":      [".wasm"],
    "documents": [".xml", ".txt", ".yaml", ".yml", ".toml", ".ini", ".cfg", ".md"],
}

# MIME 前缀 → 类别（后缀名匹配不上时用）
MIME_CATEGORIES: dict[str, str] = {
    "image/":               "images",
    "text/javascript":      "scripts",
    "application/javascript":    "scripts",
    "application/x-javascript":  "scripts",
    "text/css":             "styles",
    "text/html":            "html",
    "text/plain":           "documents",
    "application/json":     "json",
    "font/":                "fonts",
    "audio/":               "audio",
    "video/":               "video",
    "application/wasm":     "wasm",
    "application/x-font":   "fonts",
    "application/font":     "fonts",
    "application/xml":      "documents",
    "text/xml":             "documents",
    "application/octet-stream": "other",
}

# ═══════════════════════════════════════════════════════════════
#  虚拟环境管理
# ═══════════════════════════════════════════════════════════════

def _in_venv() -> bool:
    """判断当前是否运行在虚拟环境中。"""
    return sys.prefix != sys.base_prefix


def _get_venv_python() -> Path:
    """返回虚拟环境中 Python 可执行文件的路径。"""
    if sys.platform == "win32":
        return VENV_DIR / "Scripts" / "python.exe"
    return VENV_DIR / "bin" / "python"


def _get_venv_pip() -> Path:
    """返回虚拟环境中 pip 可执行文件的路径。"""
    if sys.platform == "win32":
        return VENV_DIR / "Scripts" / "pip.exe"
    return VENV_DIR / "bin" / "pip"


def ensure_venv() -> None:
    """
    确保虚拟环境存在并安装好依赖。
    - 如果已在 venv 中 → 检查 playwright 是否可用
    - 如果不在 venv 中 → 创建 / 进入 venv 并重新执行脚本
    """
    if _in_venv():
        # 已在虚拟环境中 → 检查依赖
        try:
            import playwright  # noqa: F401
        except ImportError:
            print("[setup] 在虚拟环境中安装 playwright ...")
            subprocess.run(
                [sys.executable, "-m", "pip", "install", "playwright"],
                check=True,
            )
            subprocess.run(
                [sys.executable, "-m", "playwright", "install", "chromium"],
                check=True,
            )
        return

    # ── 不在虚拟环境中 → 创建 → 重新执行 ─────────────────
    print("[setup] 检测到未在虚拟环境中运行。")

    if not VENV_DIR.exists():
        print("[setup] 创建虚拟环境 ...")
        subprocess.run([sys.executable, "-m", "venv", str(VENV_DIR)], check=True)

    python_exe = _get_venv_python()
    pip_exe = _get_venv_pip()

    # 检查 playwright
    r = subprocess.run(
        [str(python_exe), "-c", "import playwright"],
        capture_output=True, text=True,
    )
    if r.returncode != 0:
        print("[setup] 安装 playwright ...")
        subprocess.run([str(pip_exe), "install", "playwright"], check=True)
        print("[setup] 安装 Chromium 浏览器 ...")
        subprocess.run(
            [str(python_exe), "-m", "playwright", "install", "chromium"],
            check=True,
        )

    # 在虚拟环境中重新启动脚本
    print("[setup] 在虚拟环境中重新启动脚本 ...")
    sys.stdout.flush()
    subprocess.run([str(python_exe)] + sys.argv)
    sys.exit(0)


# ═══════════════════════════════════════════════════════════════
#  工具函数
# ═══════════════════════════════════════════════════════════════

def categorize_resource(url: str, content_type: str = "") -> str:
    """根据 URL 后缀或 MIME 类型判断资源类别。"""
    path = unquote(urlparse(url).path)
    ext = Path(path).suffix.lower()

    for cat, exts in EXT_CATEGORIES.items():
        if ext in exts:
            return cat

    if content_type:
        ct = content_type.split(";")[0].strip().lower()
        for prefix, cat in MIME_CATEGORIES.items():
            if ct.startswith(prefix):
                return cat

    return "other"


def make_filename(url: str, content_type: str = "") -> str:
    """从 URL 生成安全的文件名，含正确扩展名。"""
    path = unquote(urlparse(url).path)
    name = Path(path).name

    if not name or name == "/" or "." not in name:
        # URL 没有可用的文件名 → 用哈希 + MIME 扩展名
        h = hashlib.md5(url.encode()).hexdigest()[:12]
        if content_type:
            ct = content_type.split(";")[0].strip().lower()
            ext = mimetypes.guess_extension(ct) or ".bin"
        else:
            ext = ".bin"
        return f"resource_{h}{ext}"

    # 清理不安全的字符
    clean = "".join(c for c in name if c.isalnum() or c in "._-")
    clean = clean.strip(".")
    if not clean:
        h = hashlib.md5(url.encode()).hexdigest()[:12]
        return f"resource_{h}.bin"
    return clean


def format_size(n: int) -> str:
    """可读的文件大小。"""
    if n >= 1024 * 1024:
        return f"{n / 1024 / 1024:.1f} MB"
    if n >= 1024:
        return f"{n / 1024:.1f} KB"
    return f"{n} B"


# ═══════════════════════════════════════════════════════════════
#  README 自动更新
# ═══════════════════════════════════════════════════════════════

def _readme_path() -> Path:
    return BASE_DIR / "README.md"


def _script_hash() -> str:
    """当前脚本的 SHA256 前缀，用于版本追踪。"""
    content = Path(__file__).read_text(encoding="utf-8")
    return hashlib.sha256(content.encode()).hexdigest()[:16]


def update_readme(stats: dict | None = None) -> None:
    """生成 / 更新 README.md，包含当前状态和统计。"""
    shash = _script_hash()

    lines = [
        "# 游戏数据抓取工具 (Game Data Capture Tool)",
        "",
        "## 概述",
        "",
        f"自动抓取网页游戏 [`{TARGET_URL}`]({TARGET_URL}) 的所有网络请求与资源文件。",
        "启动后打开 Chrome 浏览器，实时捕获所有 HTTP 响应并分类存储到本地磁盘。",
        "",
        "## 功能特点",
        "",
        "- 自动打开 Chrome 浏览器（窗口 500x800，DPI 320）",
        "- 实时捕获所有网络数据包和资源文件",
        "- 按文件类型自动分类（图片 / 脚本 / 样式 / 字体 / 音频 / 视频 / 文档等）",
        "- 数据实时写入磁盘，不做内存缓存",
        "- 自动创建 Python 虚拟环境，自动安装 Playwright 和 Chromium",
        "- 按 `Ctrl+C` 停止并输出抓取统计",
        "",
        "## 使用方法",
        "",
        "```bash",
        "python main.py",
        "```",
        "",
        "### 首次运行",
        "",
        "脚本会自动：",
        "1. 在项目根目录创建 `.venv` 虚拟环境",
        "2. 安装 `playwright` Python 包",
        "3. 下载 Chromium 浏览器（约 150 MB）",
        "4. 打开 Chrome 窗口并开始抓取",
        "",
        "> **注意**：Chromium 下载可能需要几分钟，取决于网络速度。",
        "",
        "## 文件结构",
        "",
        "```",
        f"./",
        f"├── main.py              # 主脚本",
        f"├── README.md            # 本说明文件（自动更新）",
        f"├── .venv/               # Python 虚拟环境（自动创建）",
        f"└── data/                # 抓取的数据目录",
        f"    ├── images/          # 图片 (.png .jpg .webp …)",
        f"    ├── scripts/         # JavaScript / TypeScript",
        f"    ├── styles/          # CSS",
        f"    ├── html/            # HTML 文档",
        f"    ├── fonts/           # 字体文件",
        f"    ├── json/            # JSON 数据 / SourceMap",
        f"    ├── audio/           # 音频",
        f"    ├── video/           # 视频",
        f"    ├── wasm/            # WebAssembly",
        f"    ├── documents/       # XML / TXT 等文本",
        f"    ├── other/           # 未分类",
        f"    └── har/             # 每个资源的元数据（URL、状态码、Content-Type 等）",
        "```",
        "",
        "## 捕获内容",
        "",
        "对每个 HTTP 响应，脚本会保存：",
        "1. **资源文件本体** → 按类别放入对应子目录",
        "2. **元数据 JSON** → 放入 `data/har/`，含 URL、状态码、Content-Type、",
        "   文件大小、时间戳等信息",
        "",
        "## 注意事项",
        "",
        "- 需要稳定的网络连接",
        "- 脚本不会向网页注入任何插件或脚本，不会影响游戏功能",
        "- 不会拦截或修改任何请求/响应，仅做被动监听",
        "- 按 `Ctrl+C` 安全停止，浏览器自动关闭",
        "- 如使用系统 Chrome，请确保已安装；否则自动使用 Playwright 内置 Chromium",
        "",
        "## 依赖",
        "",
        "- Python 3.8+",
        "- Playwright（自动安装）",
        "- Chromium 浏览器（自动下载）",
        "",
        "## 更新历史",
        "",
    ]

    if stats:
        ts = datetime.now().strftime("%Y-%m-%d %H:%M")
        total = stats.get("total", 0)
        lines.append(f"- **{ts}** — 运行完成，共捕获 {total} 个资源文件")
        lines.append("")

    lines.extend([
        "---",
        f"*脚本版本: `{shash}`*",
        "",
    ])

    _readme_path().write_text("\n".join(lines), encoding="utf-8")
    print(f"[*] README.md 已自动更新 (版本: {shash})")


# ═══════════════════════════════════════════════════════════════
#  抓取核心
# ═══════════════════════════════════════════════════════════════

async def capture() -> dict:
    """
    启动浏览器并捕获所有网络资源。
    返回统计字典。
    """
    stats: dict = {
        "total": 0,
        "errors": 0,
        "bytes_total": 0,
        "by_category": {},
        "start_time": time.time(),
    }

    # 确保 data 子目录存在
    for cat in list(EXT_CATEGORIES) + ["other", "har"]:
        (DATA_DIR / cat).mkdir(parents=True, exist_ok=True)

    from playwright.async_api import async_playwright

    async with async_playwright() as pw:
        # ── 启动浏览器（优先用系统 Chrome） ─────────────
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

        context = await browser.new_context(
            viewport={"width": VIEWPORT_WIDTH, "height": VIEWPORT_HEIGHT},
            device_scale_factor=DEVICE_SCALE_FACTOR,
            ignore_https_errors=True,
        )

        page = await context.new_page()

        # ── 响应处理 ──────────────────────────────────
        async def on_response(response) -> None:
            """每个 HTTP 响应到达时立即处理并写入磁盘。"""
            url = response.url

            # 跳过 data: URI 和 redirect（3xx 无主体）
            if url.startswith("data:") or response.status in range(300, 400):
                return

            content_type = response.headers.get("content-type", "")
            category = categorize_resource(url, content_type)
            filename = make_filename(url, content_type)

            # 防重名
            file_dir = DATA_DIR / category
            dest = file_dir / filename
            counter = 1
            while dest.exists():
                stem = dest.stem
                suffix = dest.suffix
                dest = file_dir / f"{stem}_{counter}{suffix}"
                counter += 1

            try:
                body = await response.body()
            except Exception as exc:
                stats["errors"] += 1
                print(f"  [ERROR] 读取响应体失败: {url[:60]} — {exc}")
                return

            body_len = len(body)

            # ── 实时写入磁盘 ────────────────────────────
            try:
                dest.write_bytes(body)
            except Exception as exc:
                stats["errors"] += 1
                print(f"  [ERROR] 写入文件失败 {dest.name}: {exc}")
                return

            # 更新统计
            stats["total"] += 1
            stats["bytes_total"] += body_len
            cat_s = stats["by_category"].setdefault(category, {"count": 0, "bytes": 0})
            cat_s["count"] += 1
            cat_s["bytes"] += body_len

            # 写入元数据（JSON）
            meta = {
                "url": url,
                "status": response.status,
                "content_type": content_type,
                "content_length": body_len,
                "saved_as": str(dest.relative_to(BASE_DIR)),
                "timestamp": datetime.now().isoformat(),
            }
            meta_dir = DATA_DIR / "har"
            meta_file = meta_dir / f"{dest.stem}.json"
            try:
                meta_file.write_text(
                    json.dumps(meta, indent=2, ensure_ascii=False),
                    encoding="utf-8",
                )
            except Exception:
                pass  # 元数据写入失败不中断主流程

            # 控制台输出
            sz = format_size(body_len)
            print(
                f"  [{category:>8}] {response.status} "
                f"{sz:>8} | {Path(url).name[:48]:48s}"
            )

        page.on("response", on_response)

        # ── 导航 ──────────────────────────────────────
        print(f"\n[*] 正在加载: {TARGET_URL}")
        print("[*] 等待页面初始加载完成 ...\n")

        try:
            await page.goto(
                TARGET_URL,
                wait_until="networkidle",
                timeout=90_000,
            )
        except Exception as e:
            print(f"[!] 页面加载提示: {e}")
            print("[*] 继续捕获后续请求 ...")

        print("[*] 页面已加载，持续捕获网络流量 ...")
        print("[*] 按 Ctrl+C 停止抓取\n{:-^60}".format(""))

        # ── 持续捕获，直到用户中断 ────────────────────
        try:
            while True:
                await asyncio.sleep(1)
        except asyncio.CancelledError:
            pass
        finally:
            try:
                await browser.close()
            except Exception:
                pass  # Ctrl+C 后连接可能已断开，忽略关闭异常

    stats["elapsed"] = time.time() - stats["start_time"]
    return stats


# ═══════════════════════════════════════════════════════════════
#  入口
# ═══════════════════════════════════════════════════════════════

async def main() -> None:
    """主流程：执行抓取 → 输出统计 → 更新 README。"""
    print("=" * 62)
    print("   游戏数据抓取工具  —  Game Data Capture Tool")
    print("=" * 62)
    print(f"   目标: {TARGET_URL}")
    print(f"   目录: {DATA_DIR}")
    print(f"   窗口: {VIEWPORT_WIDTH}×{VIEWPORT_HEIGHT}  DPI 320")
    print("=" * 62)

    stats: dict = {}

    try:
        stats = await capture()
    except Exception:
        print("\n[!] 捕获过程异常:")
        import traceback
        traceback.print_exc()

    # ── 统计输出 ─────────────────────────────────────────
    elapsed = stats.get("elapsed", 0)
    total = stats.get("total", 0)
    errors = stats.get("errors", 0)
    bytes_total = stats.get("bytes_total", 0)

    print("\n" + "=" * 62)
    print("   抓取统计")
    print("=" * 62)
    print(f"   运行时间:  {elapsed:.1f} 秒")
    print(f"   资源总数:  {total}")
    print(f"   总大小:    {format_size(bytes_total)}")
    print(f"   错误数:    {errors}")
    print("-" * 40)
    for cat in sorted(stats.get("by_category", {})):
        d = stats["by_category"][cat]
        print(f"   {cat:>10}: {d['count']:>4d} 文件, {format_size(d['bytes'])}")
    print("-" * 40)
    print(f"   保存位置: {DATA_DIR}")
    print("=" * 62)

    # ── 更新 README ──────────────────────────────────────
    update_readme({"total": total})


if __name__ == "__main__":
    # 1) 确保环境
    ensure_venv()

    # 2) 如果 README 不存在，先生成一个占位
    if not _readme_path().exists():
        update_readme()

    # 3) 运行主流程
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n[!] 用户中断，已退出。")
    except Exception as e:
        print(f"\n[!] 未预期错误: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
