# 游戏数据抓取工具 (Game Data Capture Tool)

## 概述

自动抓取网页游戏 [`https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1`](https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1) 的所有网络请求与资源文件。
启动后打开 Chrome 浏览器，实时捕获所有 HTTP 响应并分类存储到本地磁盘。

## 功能特点

- 自动打开 Chrome 浏览器（窗口 500x800，DPI 320）
- 实时捕获所有网络数据包和资源文件
- 按文件类型自动分类（图片 / 脚本 / 样式 / 字体 / 音频 / 视频 / 文档等）
- 数据实时写入磁盘，不做内存缓存
- 自动创建 Python 虚拟环境，自动安装 Playwright 和 Chromium
- 按 `Ctrl+C` 停止并输出抓取统计

## 使用方法

```bash
python main.py
```

### 首次运行

脚本会自动：
1. 在项目根目录创建 `.venv` 虚拟环境
2. 安装 `playwright` Python 包
3. 下载 Chromium 浏览器（约 150 MB）
4. 打开 Chrome 窗口并开始抓取

> **注意**：Chromium 下载可能需要几分钟，取决于网络速度。

## 文件结构

```
./
├── main.py              # 主脚本
├── README.md            # 本说明文件（自动更新）
├── .venv/               # Python 虚拟环境（自动创建）
└── data/                # 抓取的数据目录
    ├── images/          # 图片 (.png .jpg .webp …)
    ├── scripts/         # JavaScript / TypeScript
    ├── styles/          # CSS
    ├── html/            # HTML 文档
    ├── fonts/           # 字体文件
    ├── json/            # JSON 数据 / SourceMap
    ├── audio/           # 音频
    ├── video/           # 视频
    ├── wasm/            # WebAssembly
    ├── documents/       # XML / TXT 等文本
    ├── other/           # 未分类
    └── har/             # 每个资源的元数据（URL、状态码、Content-Type 等）
```

## 捕获内容

对每个 HTTP 响应，脚本会保存：
1. **资源文件本体** → 按类别放入对应子目录
2. **元数据 JSON** → 放入 `data/har/`，含 URL、状态码、Content-Type、
   文件大小、时间戳等信息

## 注意事项

- 需要稳定的网络连接
- 脚本不会向网页注入任何插件或脚本，不会影响游戏功能
- 不会拦截或修改任何请求/响应，仅做被动监听
- 按 `Ctrl+C` 安全停止，浏览器自动关闭
- 如使用系统 Chrome，请确保已安装；否则自动使用 Playwright 内置 Chromium

## 依赖

- Python 3.8+
- Playwright（自动安装）
- Chromium 浏览器（自动下载）

## 更新历史

- **2026-07-15 16:41** — 运行完成，共捕获 0 个资源文件

---
*脚本版本: `8994f69655010bb0`*
