import cv2
import numpy as np
import time
import os
import win32gui
import win32ui
import win32con
import win32api
import sys
import ctypes
import keyboard  # 监听按键

PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32


# =========================
# 基础函数
# =========================

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)


# =========================
# 窗口枚举（关键改造）
# =========================

def get_all_parent_windows(class_name, title):
    """获取所有同类名 + 同标题的父窗口"""
    result = []

    def callback(hwnd, _):
        if win32gui.GetClassName(hwnd) == class_name:
            if win32gui.GetWindowText(hwnd) == title:
                result.append(hwnd)

    win32gui.EnumWindows(callback, None)

    if not result:
        print(f"未找到任何窗口: {class_name} / {title}")
    else:
        print(f"找到 {len(result)} 个父窗口")

    return result


def get_child_window(hwnd_parent):
    """获取 Chrome 渲染子窗口"""
    result = []

    def callback(h, _):
        cls = win32gui.GetClassName(h)
        if cls in ("Chrome_RenderWidgetHostHWND", "Intermediate D3D Window"):
            result.append(h)

    win32gui.EnumChildWindows(hwnd_parent, callback, None)
    return result[0] if result else None


# =========================
# 截图
# =========================

def window_screenshot(hwnd):
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    width = right - left
    height = bottom - top

    hdc_window = win32gui.GetWindowDC(hwnd)
    hdc_mem = win32ui.CreateDCFromHandle(hdc_window)
    compatibleDC = hdc_mem.CreateCompatibleDC()
    bmp = win32ui.CreateBitmap()
    bmp.CreateCompatibleBitmap(hdc_mem, width, height)
    compatibleDC.SelectObject(bmp)

    result = print_window(hwnd, compatibleDC.GetSafeHdc())
    if result == 0:
        print(f"警告: PrintWindow 截图失败 hwnd={hwnd}")

    bmpinfo = bmp.GetInfo()
    bmpstr = bmp.GetBitmapBits(True)

    img = np.frombuffer(bmpstr, dtype=np.uint8).reshape(
        (bmpinfo['bmHeight'], bmpinfo['bmWidth'], 4)
    )

    win32gui.DeleteObject(bmp.GetHandle())
    compatibleDC.DeleteDC()
    hdc_mem.DeleteDC()
    win32gui.ReleaseDC(hwnd, hdc_window)

    return cv2.cvtColor(img, cv2.COLOR_BGRA2BGR), (left, top)


# =========================
# 模板加载
# =========================

def load_templates(script_dir):
    jpg_dir = os.path.join(script_dir, "jpg7")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg7 目录: {jpg_dir}")
        return []

    templates = []
    for f in os.listdir(jpg_dir):
        if f.lower().endswith(".jpg"):
            path = os.path.join(jpg_dir, f)
            img = cv2.imread(path, cv2.IMREAD_COLOR)
            if img is not None:
                templates.append((f, img))
                print(f"加载模板成功: {path}")

    if not templates:
        print("jpg7 目录下没有可用模板")

    return templates


# =========================
# 图像匹配
# =========================

def find_image(target, template, threshold=0.7):
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    _, max_val, _, max_loc = cv2.minMaxLoc(res)

    if max_val >= threshold:
        h, w = template.shape[:2]
        center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
        return center, max_loc, (w, h), max_val

    return None, None, None, max_val


# =========================
# 后台点击
# =========================

def send_click(hwnd_parent, hwnd_child, x, y):
    lParam = win32api.MAKELONG(x, y)

    try:
        win32api.SendMessage(hwnd_child, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        win32api.SendMessage(hwnd_child, win32con.WM_LBUTTONUP, None, lParam)
    except Exception as e:
        print(f"子窗口点击失败: {e}")

    try:
        win32api.SendMessage(hwnd_parent, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        win32api.SendMessage(hwnd_parent, win32con.WM_LBUTTONUP, None, lParam)
    except Exception as e:
        print(f"父窗口点击失败: {e}")


# =========================
# 主逻辑（多窗口）
# =========================

def main():
    # ① 获取所有“世界Online”父窗口
    parents = get_all_parent_windows("Chrome_WidgetWin_0", "世界Online")
    if not parents:
        return

    # ② 绑定父窗口 + 子窗口
    window_pairs = []
    for hwnd_parent in parents:
        hwnd_child = get_child_window(hwnd_parent)
        if hwnd_child:
            window_pairs.append((hwnd_parent, hwnd_child))
            print(f"绑定成功: 父={hwnd_parent} 子={hwnd_child}")
        else:
            print(f"父窗口 {hwnd_parent} 未找到渲染子窗口")

    if not window_pairs:
        print("没有可用窗口，退出")
        return

    # ③ 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    CLICK_THRESHOLD = 0.75

    print("开始多窗口后台检测（不会抢鼠标）")
    print("按 Q 键结束脚本")

    # ④ 主循环
    while True:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本结束")
            break

        for hwnd_parent, hwnd_child in window_pairs:
            try:
                img, _ = window_screenshot(hwnd_child)
            except Exception as e:
                print(f"窗口 {hwnd_child} 截图失败: {e}")
                continue

            for name, template in templates:
                pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
                if pt and score >= CLICK_THRESHOLD:
                    print(f"[窗口 {hwnd_parent}] 命中 {name} 置信度={score:.2f}")
                    send_click(hwnd_parent, hwnd_child, pt[0], pt[1])
                    break

        time.sleep(0.3)


if __name__ == "__main__":
    main()
