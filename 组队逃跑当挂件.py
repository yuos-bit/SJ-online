import cv2
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

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

def get_window_handle(class_name, title):
    hwnd = win32gui.FindWindow(class_name, title)
    if hwnd == 0:
        print(f"未找到窗口: {class_name} / {title}")
    return hwnd

def get_child_window(hwnd, class_name):
    result = []
    def callback(h, lparam):
        if win32gui.GetClassName(h) == class_name:
            result.append(h)
    win32gui.EnumChildWindows(hwnd, callback, None)
    return result[0] if result else None

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

def load_templates(script_dir):
    jpg_dir = os.path.join(script_dir, "jpg-10")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg-10 目录: {jpg_dir}")
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
        print("jpg-10目录下没有可用的模板图片")
    return templates

def find_image(target, template, threshold=0.7):
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    if max_val >= threshold:
        h, w = template.shape[:2]
        center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
        return center, max_loc, (w, h), max_val
    return None, None, None, max_val

def send_click(hwnd_parent, hwnd_child, x, y):
    """同时向子窗口和父窗口发送后台点击"""
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

def main():
    hwnd_parent = get_window_handle("Chrome_WidgetWin_0", "世界Online")
    if hwnd_parent == 0:
        return

    hwnd_child = get_child_window(hwnd_parent, "Intermediate D3D Window")
    if hwnd_child is None:
        print("未找到子窗口: Intermediate D3D Window")
        return
    else:
        print(f"找到父窗口句柄: {hwnd_parent}，子窗口句柄: {hwnd_child}")

    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    CLICK_THRESHOLD = 0.90  # 置信度阈值

    print("开始后台循环检测（不会抢鼠标），请保持游戏窗口不要最小化...")
    print("按 Q 键可以随时结束脚本。")

    while True:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本已结束。")
            break

        img, (win_left, win_top) = window_screenshot(hwnd_child)
        clicked = False

        # 遍历所有模板进行匹配
        for name, template in templates:
            pt, top_left, size, score = find_image(img, template, CLICK_THRESHOLD)
            if pt and score >= CLICK_THRESHOLD:
                abs_x = pt[0]
                abs_y = pt[1]
                print(f"找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                clicked = True
                break  # 匹配到一个模板就点击并跳出循环

        # 50ms 循环间隔
        if not clicked:
            time.sleep(0.02)
        else:
            time.sleep(0.1)  # 匹配点击后延迟100ms

if __name__ == "__main__":
    main()
