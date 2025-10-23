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

def get_child_window(hwnd_parent, target_class, target_title=None):
    """查找指定类名和标题的子窗口"""
    result = []
    def callback(child_hwnd, lparam):
        if win32gui.GetClassName(child_hwnd) == target_class:
            if target_title is None or win32gui.GetWindowText(child_hwnd) == target_title:
                result.append(child_hwnd)
    win32gui.EnumChildWindows(hwnd_parent, callback, None)
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
    """按文件名数字顺序加载模板（如1.jpg、2.jpg...）"""
    jpg_dir = os.path.join(script_dir, "jpg-hm")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg-hm 目录: {jpg_dir}")
        return []
    # 按文件名中的数字排序（支持1.jpg < 2.jpg < 10.jpg）
    jpg_files = sorted(
        [f for f in os.listdir(jpg_dir) if f.lower().endswith(".jpg")],
        key=lambda x: int(os.path.splitext(x)[0]) if os.path.splitext(x)[0].isdigit() else x
    )
    templates = []
    for f in jpg_files:
        path = os.path.join(jpg_dir, f)
        img = cv2.imread(path, cv2.IMREAD_COLOR)
        if img is not None:
            templates.append((f, img))
            print(f"加载模板成功: {path}")
    if not templates:
        print("jpg-hm目录下没有可用的模板图片")
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
    """同时向父窗口和子窗口发送点击（确保响应）"""
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
    # 1. 获取窗口句柄（适配你的MuMu窗口结构）
    # 顶层父窗口：Chrome_RenderWidgetHostHWND / MuMu安卓设备
    hwnd_parent = get_window_handle("Chrome_WidgetWin_1", "世界OL - 墨贤 - Google Chrome")
    if hwnd_parent == 0:
        return

    # 第一层子窗口：Chrome_RenderWidgetHostHWND / Chrome Legacy Window
    hwnd_child = get_child_window(hwnd_parent, "Chrome_RenderWidgetHostHWND", "Chrome Legacy Window")
    if hwnd_child is None:
        print("未找到子窗口: Chrome_RenderWidgetHostHWND / Chrome Legacy Window")
        return
    else:
        print(f"找到父窗口句柄: {hwnd_parent}，子窗口句柄: {hwnd_child}")

    # 2. 加载模板（按顺序）
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    # 3. 配置参数
    CLICK_THRESHOLD = 0.85  # 匹配置信度阈值
    MAX_ROUNDS = 120  # 最大循环轮数（可根据需要修改）
    current_index = 0  # 当前模板索引（从0开始）
    total_templates = len(templates)
    rounds = 0  # 已完成轮数

    print("开始按顺序点击模板，按 Q 键结束...")
    print(f"总模板数: {total_templates}，最大轮数: {MAX_ROUNDS}")

    while rounds < MAX_ROUNDS:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本已结束。")
            break

        # 截取子窗口图像
        img, _ = window_screenshot(hwnd_child)
        # 获取当前需要匹配的模板
        name, template = templates[current_index]

        # 匹配当前模板
        pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
        if pt and score >= CLICK_THRESHOLD:
            # 点击当前模板位置
            click_x, click_y = pt
            print(f"找到目标[{current_index+1}/{total_templates}]: {name} 置信度={score:.2f} 坐标: {pt}")
            send_click(hwnd_parent, hwnd_child, click_x, click_y)

            # 切换到下一个模板
            if current_index == total_templates - 1:
                # 完成一轮，重置索引并计数
                rounds += 1
                current_index = 0
                print(f"—— 完成第 {rounds}/{MAX_ROUNDS} 轮 ——")
            else:
                current_index += 1

            time.sleep(0.3)  # 点击后延迟，避免过快
        else:
            # 未找到当前模板，快速重试
            time.sleep(0.05)

    if rounds >= MAX_ROUNDS:
        print("已达到最大轮数，脚本结束。")

if __name__ == "__main__":
    main()