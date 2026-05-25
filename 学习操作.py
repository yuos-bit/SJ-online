import pynput
import win32gui
import win32ui
import win32con
import win32api
import ctypes
import cv2
import numpy as np
import os
import time

# --- 配置 ---
TARGET_WINDOW_TITLE = "墨族"
SAVE_DIR = "dataset"
os.makedirs(SAVE_DIR, exist_ok=True)

def get_target_hwnd():
    return win32gui.FindWindow("LDPlayerMainFrame", TARGET_WINDOW_TITLE)

def get_window_client_image(hwnd):
    """严格只截图指定句柄窗口的客户区内容"""
    left, top, right, bottom = win32gui.GetClientRect(hwnd)
    width = right - left
    height = bottom - top
    if width <= 0 or height <= 0: return None

    hwnd_dc = win32gui.GetWindowDC(hwnd)
    mfc_dc = win32ui.CreateDCFromHandle(hwnd_dc)
    save_dc = mfc_dc.CreateCompatibleDC()
    bitmap = win32ui.CreateBitmap()
    bitmap.CreateCompatibleBitmap(mfc_dc, width, height)
    save_dc.SelectObject(bitmap)

    # 使用 PrintWindow 强制绘制客户区内容
    ctypes.windll.user32.PrintWindow(hwnd, save_dc.GetSafeHdc(), 2)

    bmp_info = bitmap.GetInfo()
    bmp_str = bitmap.GetBitmapBits(True)
    img = np.frombuffer(bmp_str, dtype=np.uint8).reshape((bmp_info['bmHeight'], bmp_info['bmWidth'], 4))
    
    win32gui.DeleteObject(bitmap.GetHandle())
    save_dc.DeleteDC()
    mfc_dc.DeleteDC()
    win32gui.ReleaseDC(hwnd, hwnd_dc)

    return cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)

def on_click(x, y, button, pressed):
    if pressed:
        hwnd = get_target_hwnd()
        if not hwnd: return
        
        # 获取窗口相对于屏幕的矩形，判断点击是否在窗口范围内
        rect = win32gui.GetWindowRect(hwnd)
        if rect[0] <= x <= rect[2] and rect[1] <= y <= rect[3]:
            # 转换为客户区相对坐标
            client_pt = win32gui.ScreenToClient(hwnd, (x, y))
            
            # 截取窗口纯净截图
            img = get_window_client_image(hwnd)
            if img is not None:
                timestamp = int(time.time() * 1000)
                img_name = f"{timestamp}.png"
                cv2.imwrite(os.path.join(SAVE_DIR, img_name), img)
                
                with open(f"{SAVE_DIR}/log.txt", "a") as f:
                    f.write(f"{img_name} | {client_pt[0]} | {client_pt[1]}\n")
                
                print(f"[{timestamp}] 已记录: 窗口相对坐标({client_pt[0]}, {client_pt[1]})")

print(f"监听已启动... 只有在窗口 '{TARGET_WINDOW_TITLE}' 内部的点击才会被记录")
with pynput.mouse.Listener(on_click=on_click) as listener:
    listener.join()