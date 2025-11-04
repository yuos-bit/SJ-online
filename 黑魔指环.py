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
    jpg_dir = os.path.join(script_dir, "jpg5")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg5 目录: {jpg_dir}")
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
        print("jpg5目录下没有可用的模板图片")
    return templates

def find_image(target, template, threshold=0.7):
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    if max_val >= threshold:
        h, w = template.shape[:2]
        center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
        return center, max_loc, (w, h), max_val
    return None, None, None, max_val

def send_click_to_window(hwnd, x, y):
    """向单个窗口发送点击事件（使用客户区坐标）"""
    try:
        lParam = win32api.MAKELONG(x, y)
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, None, lParam)
        return True
    except Exception as e:
        print(f"窗口 {hwnd} 点击失败: {e}")
        return False

def send_click_to_all(windows, coords):
    """向多个窗口发送点击，每个窗口对应自己的坐标"""
    for hwnd, (x, y) in zip(windows, coords):
        send_click_to_window(hwnd, x, y)

def main():
    # 1. 获取三层窗口句柄
    # 最外层窗口：Qt5156QWindowIcon / MuMu安卓设备
    hwnd_outer = get_window_handle("Qt5156QWindowIcon", "MuMu安卓设备")
    if hwnd_outer == 0:
        return

    # 中间层窗口：Qt5156QWindowIcon / MuMuNxDevice（作为最外层的子窗口）
    hwnd_mid = get_child_window(hwnd_outer, "Qt5156QWindowIcon", "MuMuNxDevice")
    if hwnd_mid is None:
        print("未找到中间层窗口: Qt5156QWindowIcon / MuMuNxDevice")
        return

    # 最内层窗口：nemuwin / nemudisplay（作为中间层的子窗口）
    hwnd_inner = get_child_window(hwnd_mid, "nemuwin", "nemudisplay")
    if hwnd_inner is None:
        print("未找到最内层窗口: nemuwin / nemudisplay")
        return

    print(f"找到窗口层级 - 外层: {hwnd_outer}, 中间层: {hwnd_mid}, 内层: {hwnd_inner}")

    # 2. 加载模板（按顺序）
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    # 3. 配置参数
    CLICK_THRESHOLD = 0.85  # 匹配置信度阈值
    MAX_ROUNDS = 120  # 最大循环轮数
    current_index = 0  # 当前模板索引（从0开始）
    total_templates = len(templates)
    rounds = 0  # 已完成轮数

    print("开始按顺序点击模板，按 Q 键结束...")
    print(f"总模板数: {total_templates}，最大轮数: {MAX_ROUNDS}")

    # 窗口列表（三层）
    window_handles = [hwnd_outer, hwnd_mid, hwnd_inner]

    while rounds < MAX_ROUNDS:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本已结束。")
            break

        # 截取最外层窗口图像（用于识别）
        img, (outer_left, outer_top) = window_screenshot(hwnd_outer)
        # 获取当前需要匹配的模板
        name, template = templates[current_index]

        # 匹配当前模板
        pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
        if pt and score >= CLICK_THRESHOLD:
            # 计算目标点在屏幕上的绝对坐标（基于最外层窗口位置）
            screen_x = outer_left + pt[0]
            screen_y = outer_top + pt[1]

            # 计算每个窗口的客户区坐标（关键：将屏幕坐标转换为各窗口的内部坐标）
            coords = []
            for hwnd in window_handles:
                client_x, client_y = win32gui.ScreenToClient(hwnd, (screen_x, screen_y))
                coords.append((client_x, client_y))

            # 输出点击信息
            print(f"找到目标[{current_index+1}/{total_templates}]: {name}")
            print(f"  置信度: {score:.2f}，屏幕坐标: ({screen_x}, {screen_y})")
            print(f"  各窗口客户区坐标: {coords}")
            
            # 识别到后延迟0.4秒再点击
            print("  延迟0.4秒后执行点击...")
            time.sleep(0.4)

            # 向三层窗口同时发送点击
            send_click_to_all(window_handles, coords)

            # 切换到下一个模板
            if current_index == total_templates - 1:
                # 完成一轮，重置索引并计数
                rounds += 1
                current_index = 0
                print(f"—— 完成第 {rounds}/{MAX_ROUNDS} 轮 ——")
            else:
                current_index += 1

            # 点击后可根据需要保留延迟（避免操作过快），此处保留0.5秒
            time.sleep(0.5)
        else:
            # 未找到当前模板，快速重试
            time.sleep(0.1)

    if rounds >= MAX_ROUNDS:
        print("已达到最大轮数，脚本结束。")

if __name__ == "__main__":
    main()