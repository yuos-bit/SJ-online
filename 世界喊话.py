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
import keyboard

PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

def get_window_handle_by_class_and_keyword(class_name, keyword):
    hwnds = []

    def callback(hwnd, lparam):
        if win32gui.IsWindowVisible(hwnd):
            cls = win32gui.GetClassName(hwnd)
            title = win32gui.GetWindowText(hwnd)
            if cls == class_name and keyword in title:
                hwnds.append(hwnd)
    win32gui.EnumWindows(callback, None)
    if hwnds:
        print(f"找到窗口: hwnd={hwnds[0]}")
        return hwnds[0]
    else:
        print(f"未找到窗口: {class_name} / 包含'{keyword}'")
        return 0

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
    jpg_dir = os.path.join(script_dir, "jpg-5")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg-5 目录: {jpg_dir}")
        return []
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
        print("jpg-5目录下没有可用的模板图片")
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

def send_text_to_window(hwnd, text):
    edit = get_child_window(hwnd, "Edit")
    if edit:
        win32api.SendMessage(edit, win32con.WM_SETTEXT, 0, text)
        win32api.SendMessage(edit, win32con.WM_KEYDOWN, win32con.VK_RETURN, 0)
        win32api.SendMessage(edit, win32con.WM_KEYUP, win32con.VK_RETURN, 0)
        print(f"已发送到 Edit: {text}")
    else:
        for c in text:
            win32api.PostMessage(hwnd, win32con.WM_CHAR, ord(c), 0)
        win32api.PostMessage(hwnd, win32con.WM_CHAR, ord('\r'), 0)
        print(f"已发送到窗口 hwnd={hwnd} (无 Edit): {text}")

def main():
    hwnd_parent = get_window_handle_by_class_and_keyword("Chrome_WidgetWin_0", "世界")
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

    CLICK_THRESHOLD = 0.85
    MAX_ROUNDS = 100
    MESSAGE_INTERVAL = 20
    MESSAGE_TEXT = "1金1件收战神套装，现在什么都缺，直邮不卡!/f03/f03/f03/b030/b039"

    print("开始顺序后台检测并点击，每张图按顺序点击...")
    print("按 Q 键可以随时结束脚本。")

    rounds = 0
    last_message_time = 0

    while rounds < MAX_ROUNDS:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本已结束。")
            break

        # 每轮顺序点击所有模板
        for index, (name, template) in enumerate(templates):
            img, _ = window_screenshot(hwnd_child)
            pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
            if pt and score >= CLICK_THRESHOLD:
                abs_x, abs_y = pt
                print(f"找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)

                # 第三张图点击后立即发送消息
                if index == 2:
                    now = time.time()
                    if now - last_message_time >= MESSAGE_INTERVAL:
                        send_text_to_window(hwnd_parent, MESSAGE_TEXT)
                        last_message_time = now
                    else:
                        remaining = MESSAGE_INTERVAL - (now - last_message_time)
                        print(f"消息冷却中，还剩 {remaining:.1f} 秒，等待发送...")
                        while remaining > 0:
                            if keyboard.is_pressed('q'):
                                print("检测到 Q 键，脚本已结束。")
                                return
                            time.sleep(0.5)
                            remaining -= 0.5
                        send_text_to_window(hwnd_parent, MESSAGE_TEXT)
                        last_message_time = time.time()

            if keyboard.is_pressed('q'):
                print("检测到 Q 键，脚本已结束。")
                return

            time.sleep(0.3)

        # 一轮完成后等待 MESSAGE_INTERVAL 秒
        print(f"—— 完成第 {rounds+1}/{MAX_ROUNDS} 轮，等待 {MESSAGE_INTERVAL} 秒后开始下一轮 ——")
        waited = 0
        while waited < MESSAGE_INTERVAL:
            if keyboard.is_pressed('q'):
                print("检测到 Q 键，脚本已结束。")
                return
            time.sleep(1)
            waited += 1

        rounds += 1

    print("脚本结束。")

if __name__ == "__main__":
    main()
