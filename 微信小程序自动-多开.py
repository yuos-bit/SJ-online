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
import threading  # 改用独立线程处理每个窗口

PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

# 全局退出标志
EXIT_FLAG = False

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

def get_all_window_handles(parent_class_name, parent_title):
    """获取所有匹配类名和标题的父窗口句柄列表"""
    hwnd_list = []
    
    def callback(hwnd, extra):
        # 获取窗口标题和类名
        window_title = win32gui.GetWindowText(hwnd)
        window_class = win32gui.GetClassName(hwnd)
        
        # 匹配父窗口特征
        if window_class == parent_class_name and parent_title in window_title:
            hwnd_list.append(hwnd)
        return True
    
    # 枚举所有顶层窗口
    win32gui.EnumWindows(callback, None)
    
    if not hwnd_list:
        print(f"未找到任何匹配的窗口: {parent_class_name} / {parent_title}")
    else:
        print(f"找到 {len(hwnd_list)} 个匹配的窗口，句柄列表: {hwnd_list}")
    
    return hwnd_list

def get_child_window(hwnd, class_name):
    result = []
    def callback(h, lparam):
        if win32gui.GetClassName(h) == class_name:
            result.append(h)
        return True  # 修复：添加返回True保证枚举完成
    win32gui.EnumChildWindows(hwnd, callback, None)
    return result[0] if result else None

def window_screenshot(hwnd):
    """窗口截图函数，增加异常处理"""
    try:
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
            # 降级方案：如果PrintWindow失败，尝试用BitBlt截图
            compatibleDC.BitBlt((0, 0), (width, height), hdc_window, (0, 0), win32con.SRCCOPY)

        bmpinfo = bmp.GetInfo()
        bmpstr = bmp.GetBitmapBits(True)
        img = np.frombuffer(bmpstr, dtype=np.uint8).reshape(
            (bmpinfo['bmHeight'], bmpinfo['bmWidth'], 4)
        )

        # 资源释放
        win32gui.DeleteObject(bmp.GetHandle())
        compatibleDC.DeleteDC()
        hdc_mem.DeleteDC()
        win32gui.ReleaseDC(hwnd, hdc_window)

        return cv2.cvtColor(img, cv2.COLOR_BGRA2BGR), (left, top)
    except Exception as e:
        print(f"截图出错 hwnd={hwnd}: {e}")
        return None, (0, 0)

def load_templates(script_dir):
    jpg_dir = os.path.join(script_dir, "jpg6")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg6 目录: {jpg_dir}")
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
        print("jpg6目录下没有可用的模板图片")
    return templates

def find_image(target, template, threshold=0.7):
    try:
        # 先检查目标图像是否有效
        if target is None or target.size == 0:
            return None, None, None, 0.0
        
        # 检查模板和目标图像尺寸匹配
        if template.shape[0] > target.shape[0] or template.shape[1] > target.shape[1]:
            print("模板尺寸大于目标图像，跳过匹配")
            return None, None, None, 0.0
            
        res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
        min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
        if max_val >= threshold:
            h, w = template.shape[:2]
            center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
            return center, max_loc, (w, h), max_val
        return None, None, None, max_val
    except Exception as e:
        print(f"模板匹配出错: {e}")
        return None, None, None, 0.0

def send_click(hwnd_parent, hwnd_child, x, y):
    """同时向子窗口和父窗口发送后台点击"""
    lParam = win32api.MAKELONG(x, y)
    try:
        win32api.SendMessage(hwnd_child, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.01)  # 增加短延迟模拟真实点击
        win32api.SendMessage(hwnd_child, win32con.WM_LBUTTONUP, 0, lParam)
    except Exception as e:
        print(f"子窗口点击失败 hwnd={hwnd_child}: {e}")

    try:
        win32api.SendMessage(hwnd_parent, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.01)
        win32api.SendMessage(hwnd_parent, win32con.WM_LBUTTONUP, 0, lParam)
    except Exception as e:
        print(f"父窗口点击失败 hwnd={hwnd_parent}: {e}")

def window_worker(hwnd_parent, templates, click_threshold):
    """单个窗口的独立工作线程，持续运行直到退出标志被设置"""
    print(f"启动窗口 {hwnd_parent} 的监控线程")
    
    # 先预获取子窗口
    hwnd_child = get_child_window(hwnd_parent, "Intermediate D3D Window")
    if hwnd_child is None:
        print(f"窗口 {hwnd_parent} 未找到子窗口: Intermediate D3D Window，线程退出")
        return
    
    # 持续监控直到退出
    while not EXIT_FLAG:
        try:
            # 窗口截图
            img, (win_left, win_top) = window_screenshot(hwnd_child)
            if img is None:
                time.sleep(0.1)
                continue

            # 遍历所有模板进行匹配
            matched = False
            for name, template in templates:
                pt, top_left, size, score = find_image(img, template, click_threshold)
                if pt and score >= click_threshold:
                    abs_x = pt[0]
                    abs_y = pt[1]
                    print(f"窗口 {hwnd_parent} 找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                    send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                    matched = True
                    time.sleep(0.2)  # 点击后短延迟
                    break  # 匹配到一个就停止
            
            # 根据是否匹配到调整循环间隔
            if matched:
                time.sleep(0.2)
            else:
                time.sleep(0.3)
                
        except Exception as e:
            print(f"窗口 {hwnd_parent} 运行出错: {e}")
            time.sleep(0.5)  # 出错后稍等再重试

    print(f"窗口 {hwnd_parent} 的监控线程已退出")

def main():
    global EXIT_FLAG
    EXIT_FLAG = False

    # 获取所有匹配的父窗口
    hwnd_parent_list = get_all_window_handles("Chrome_WidgetWin_0", "世界Online")
    if not hwnd_parent_list:
        return

    # 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    CLICK_THRESHOLD = 0.90  # 置信度阈值
    print("="*50)
    print("开始后台循环检测多个窗口（不会抢鼠标），请保持游戏窗口不要最小化...")
    print("按 Q 键可以随时结束脚本。")
    print("="*50)

    # 为每个窗口创建独立的工作线程
    worker_threads = []
    for hwnd in hwnd_parent_list:
        thread = threading.Thread(
            target=window_worker,
            args=(hwnd, templates, CLICK_THRESHOLD),
            daemon=True  # 设置为守护线程，主程序退出时自动结束
        )
        thread.start()
        worker_threads.append(thread)
        time.sleep(0.1)  # 错开线程启动时间，避免资源竞争

    # 主线程监听退出按键
    try:
        while True:
            if keyboard.is_pressed('q'):
                print("检测到 Q 键，正在停止所有窗口监控...")
                EXIT_FLAG = True
                break
            time.sleep(0.1)  # 降低按键检测频率
    except KeyboardInterrupt:
        print("脚本被手动中断")
        EXIT_FLAG = True
    finally:
        # 等待所有工作线程结束
        for thread in worker_threads:
            thread.join(timeout=2.0)
        print("所有窗口监控线程已停止，脚本完全退出")

if __name__ == "__main__":
    main()