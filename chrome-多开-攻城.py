import cv2
import numpy as np
import time
import os
import sys
import subprocess
import ctypes
import win32gui
import win32ui
import win32con
import win32api
import keyboard

# ================== Chrome 启动配置 ==================
CHROME_PATH = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=live_douyin2"

WINDOW_WIDTH = 420
#定义窗口宽度
WINDOW_HEIGHT = 850
#定义窗口高度
WINDOW_COUNT = 5
# 一共开的窗口数
WINDOWS_PER_ROW = 5
# 横着排列的窗口数
# ====================================================

PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

# ================== Chrome 启动 ==================
def launch_chrome_windows():
    base_profile = os.path.abspath("chrome_profiles")
    os.makedirs(base_profile, exist_ok=True)

    for i in range(WINDOW_COUNT):
        profile = os.path.join(base_profile, f"profile_{i}")
        x = (i % WINDOWS_PER_ROW) * WINDOW_WIDTH
        y = (i // WINDOWS_PER_ROW) * WINDOW_HEIGHT

        cmd = [
            CHROME_PATH,
            f"--user-data-dir={profile}",
            "--no-first-run",
            "--disable-session-crashed-bubble",
            f"--window-size={WINDOW_WIDTH},{WINDOW_HEIGHT}",
            f"--window-position={x},{y}",
            "--new-window",
            URL
        ]
        subprocess.Popen(cmd)
        time.sleep(0.5)

# ================== 窗口枚举 ==================
def get_worldol_windows():
    """获取所有标题以 世界OL 开头的 Chrome 窗口"""
    result = []

    def callback(hwnd, _):
        if not win32gui.IsWindowVisible(hwnd):
            return
        if win32gui.GetClassName(hwnd) != "Chrome_WidgetWin_1":
            return

        title = win32gui.GetWindowText(hwnd)
        if title.startswith("世界"):
            result.append((hwnd, title))

    win32gui.EnumWindows(callback, None)
    print(f"🎯 找到 {len(result)} 个 世界OL Chrome 窗口")
    return result

def get_render_window(hwnd):
    """获取 Chrome 渲染窗口，如果找不到返回父窗口"""
    child = None
    def cb(h, _):
        nonlocal child
        if win32gui.GetClassName(h) == "Chrome_RenderWidgetHostHWND":
            child = h

    for _ in range(5):
        win32gui.EnumChildWindows(hwnd, cb, None)
        if child:
            return child
        time.sleep(0.1)

    return hwnd

# ================== 截图 ==================
def window_screenshot(hwnd):
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    w, h = right - left, bottom - top

    hdc = win32gui.GetWindowDC(hwnd)
    mfc = win32ui.CreateDCFromHandle(hdc)
    mem = mfc.CreateCompatibleDC()

    bmp = win32ui.CreateBitmap()
    bmp.CreateCompatibleBitmap(mfc, w, h)
    mem.SelectObject(bmp)

    print_window(hwnd, mem.GetSafeHdc())

    bmpinfo = bmp.GetInfo()
    bmpstr = bmp.GetBitmapBits(True)

    img = np.frombuffer(bmpstr, dtype=np.uint8).reshape(
        (bmpinfo['bmHeight'], bmpinfo['bmWidth'], 4)
    )

    win32gui.DeleteObject(bmp.GetHandle())
    mem.DeleteDC()
    mfc.DeleteDC()
    win32gui.ReleaseDC(hwnd, hdc)

    return cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)

# ================== 模板 ==================
def load_templates():
    base = os.path.join(os.path.dirname(sys.argv[0]), "jpg-7")
    templates = []

    if not os.path.exists(base):
        print(f"❌ 模板目录不存在: {base}")
        return []

    for f in sorted(os.listdir(base), key=lambda x: int(os.path.splitext(x)[0])):
        if f.lower().endswith((".jpg", ".png")):
            img = cv2.imread(os.path.join(base, f))
            if img is not None:
                templates.append((f, img))

    print(f"📦 加载 {len(templates)} 个模板")
    return templates

def find_image(img, tpl, threshold=0.7):
    res = cv2.matchTemplate(img, tpl, cv2.TM_CCOEFF_NORMED)
    _, max_val, _, max_loc = cv2.minMaxLoc(res)

    if max_val >= threshold:
        h, w = tpl.shape[:2]
        return (max_loc[0] + w // 2, max_loc[1] + h // 2), max_val
    return None, max_val

# ================== 点击 ==================
def send_click(hwnd, x, y):
    lp = win32api.MAKELONG(x, y)
    win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lp)
    time.sleep(0.02)
    win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, None, lp)

# ================== 主逻辑 ==================
def main():
    print("🚀 启动 Chrome 窗口")
    launch_chrome_windows()
    time.sleep(6)

    templates = load_templates()
    if not templates:
        return

    windows = get_worldol_windows()
    targets = [(hwnd, get_render_window(hwnd), title) for hwnd, title in windows]

    if not targets:
        print("❌ 未找到任何 世界OL 窗口")
        return

    # 每个窗口维护状态机
    runners = []
    for hwnd, target_hwnd, title in targets:
        runners.append({
            "hwnd": hwnd,
            "target": target_hwnd,
            "title": title,
            "index": 0,      # 当前模板索引
            "rounds": 0,     # 已完成轮数
        })

    CLICK_THRESHOLD = 0.70
    #置信度
    MAX_RETRIES = 1
    #1轮
    RETRY_INTERVAL = 0.001
    #单位：秒
    AFTER_CLICK_DELAY = 0.001
    #单位：秒

    print("🎯 开始按【模板顺序 + 强制重试】执行（按 Q 退出）")

    while True:
        if keyboard.is_pressed('q'):
            print("🛑 用户退出")
            break

        for runner in runners:
            hwnd = runner["hwnd"]
            target = runner["target"]
            title = runner["title"]
            idx = runner["index"]

            tpl_name, tpl_img = templates[idx]
            retry = 0
            matched = False

            while retry < MAX_RETRIES:
                img = window_screenshot(target)
                center, score = find_image(img, tpl_img, CLICK_THRESHOLD)

                if center and score >= CLICK_THRESHOLD:
                    x, y = center
                    print(
                        f"✅ [{title}] "
                        f"模板[{idx+1}/{len(templates)}] {tpl_name} "
                        f"| 置信度={score:.2f}"
                    )
                    send_click(target, x, y)
                    matched = True
                    break
                else:
                    if retry % 5 == 0:
                        print(
                            f"🔍 [{title}] 重试[{retry}/{MAX_RETRIES}] "
                            f"{tpl_name} | 最高置信度={score:.2f}"
                        )
                    retry += 1
                    time.sleep(RETRY_INTERVAL)

            # 模板推进逻辑
            runner["index"] += 1
            if runner["index"] >= len(templates):
                runner["index"] = 0
                runner["rounds"] += 1
                print(f"🎉 [{title}] 完成第 {runner['rounds']} 轮模板")

            time.sleep(AFTER_CLICK_DELAY)

if __name__ == "__main__":
    main()
