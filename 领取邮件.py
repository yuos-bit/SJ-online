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

def get_child_window(hwnd_parent, target_class, target_title=None):
    result = []
    def callback(child_hwnd, lparam):
        if win32gui.GetClassName(child_hwnd) == target_class:
            if target_title is None or win32gui.GetWindowText(child_hwnd) == target_title:
                result.append(child_hwnd)
    win32gui.EnumChildWindows(hwnd_parent, callback, None)
    return result[0] if result else None

def load_templates(script_dir):
    """从 jpg3 目录加载图片"""
    jpg_dir = os.path.join(script_dir, "jpg3")
    if not os.path.exists(jpg_dir):
        print(f"错误: 未找到 jpg3 目录: {jpg_dir}")
        return []
    
    # 排序逻辑：1.jpg, 2.jpg...
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
            print(f"成功加载模板: {f}")
    return templates

def window_screenshot(hwnd):
    """极速截图"""
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    width, height = right - left, bottom - top
    
    hdc_window = win32gui.GetWindowDC(hwnd)
    hdc_mem = win32ui.CreateDCFromHandle(hdc_window)
    compatible_dc = hdc_mem.CreateCompatibleDC()
    
    bmp = win32ui.CreateBitmap()
    bmp.CreateCompatibleBitmap(hdc_mem, width, height)
    compatible_dc.SelectObject(bmp)
    
    # 后台截图核心
    user32.PrintWindow(hwnd, compatible_dc.GetSafeHdc(), PW_RENDERFULLCONTENT)
    
    bmpstr = bmp.GetBitmapBits(True)
    img = np.frombuffer(bmpstr, dtype=np.uint8).reshape((height, width, 4))
    
    # 清理资源
    win32gui.DeleteObject(bmp.GetHandle())
    compatible_dc.DeleteDC()
    hdc_mem.DeleteDC()
    win32gui.ReleaseDC(hwnd, hdc_window)
    
    return img, (left, top)

def main():
    # 1. 初始化窗口句柄 (保持你的三层逻辑)
    hwnd_outer = win32gui.FindWindow("LDPlayerMainFrame", "墨族")
    if not hwnd_outer:
        print("错误: 找不到模拟器主窗口")
        return
    
    hwnd_mid = get_child_window(hwnd_outer, "RenderWindow", "TheRender")
    hwnd_inner = get_child_window(hwnd_mid, "subWin", "sub") if hwnd_mid else None
    
    # 只要能点到内层即可，如果层级复杂，建议直接用 outer 或 inner
    window_handles = [hwnd_outer, hwnd_mid, hwnd_inner]
    window_handles = [h for h in window_handles if h] # 过滤掉 None

    # 2. 加载图片
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    
    if not templates:
        print("错误: templates 列表为空！请检查 jpg3 文件夹内是否有 .jpg 文件")
        return

    # 3. 运行配置
    WAIT_FOR_IMAGE_TIMEOUT = 0.5  # 单个图片找不到时，持续循环找0.5秒
    MATCH_THRESHOLD = 0.8
    current_index = 0
    total_templates = len(templates)

    print(f"\n--- 极速模式启动 (共 {total_templates} 张图) ---")
    print("按 Q 退出脚本\n")

    while True:
        if keyboard.is_pressed('q'):
            print("脚本已停止")
            break
        
        name, temp_img = templates[current_index]
        start_wait_time = time.time()
        found_this_step = False

        # 高频识别循环
        while time.time() - start_wait_time < WAIT_FOR_IMAGE_TIMEOUT:
            if keyboard.is_pressed('q'): return

            img_bgra, (ol, ot) = window_screenshot(hwnd_outer)
            target_bgr = img_bgra[:, :, :3] # 快速转换
            
            res = cv2.matchTemplate(target_bgr, temp_img, cv2.TM_CCOEFF_NORMED)
            _, max_val, _, max_loc = cv2.minMaxLoc(res)
            
            if max_val >= MATCH_THRESHOLD:
                # 计算中心点
                h, w = temp_img.shape[:2]
                screen_x = ol + max_loc[0] + w // 2
                screen_y = ot + max_loc[1] + h // 2
                
                # 执行点击 (PostMessage 不堵塞)
                for h_target in window_handles:
                    cx, cy = win32gui.ScreenToClient(h_target, (screen_x, screen_y))
                    lParam = win32api.MAKELONG(cx, cy)
                    win32api.PostMessage(h_target, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
                    win32api.PostMessage(h_target, win32con.WM_LBUTTONUP, 0, lParam)
                
                print(f"[{current_index+1}/{total_templates}] 命中: {name} (置信度: {max_val:.2f})")
                found_this_step = True
                break 
            
            # 缩短重试间隔：几乎不休眠，实现极速重试
            time.sleep(0.01)

        if found_this_step:
            current_index = (current_index + 1) % total_templates
            time.sleep(0.2) # 点击后的缓冲，防止过快
        else:
            print(f"超时: 未找到 {name}，尝试下一张...")
            current_index = (current_index + 1) % total_templates

if __name__ == "__main__":
    main()