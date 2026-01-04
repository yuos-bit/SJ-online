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
import threading
from queue import Queue

PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

# 全局控制变量
stop_event = threading.Event()
window_queues = {}  # 存储每个窗口的消息队列

def print_window(hwnd, hdc):
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

def get_all_window_handles(class_name, title):
    """获取所有匹配类名和标题的窗口句柄"""
    hwnds = []
    
    def callback(hwnd, lparam):
        if win32gui.IsWindowVisible(hwnd):
            window_title = win32gui.GetWindowText(hwnd)
            window_class = win32gui.GetClassName(hwnd)
            
            # 匹配类名和标题
            class_match = (class_name == "*" or window_class == class_name)
            title_match = (title == "*" or window_title == title)
            
            if class_match and title_match:
                hwnds.append(hwnd)
    
    win32gui.EnumWindows(callback, None)
    
    if not hwnds:
        print(f"未找到窗口: {class_name} / {title}")
    else:
        print(f"找到 {len(hwnds)} 个匹配窗口")
        for i, hwnd in enumerate(hwnds):
            print(f"窗口 {i+1}: 句柄={hwnd}, 标题='{win32gui.GetWindowText(hwnd)}'")
    
    return hwnds

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
    jpg_dir = os.path.join(script_dir, "jpg3")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg3 目录: {jpg_dir}")
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
        print("jpg3目录下没有可用的模板图片")
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

def process_window(hwnd_parent, hwnd_child, templates, CLICK_THRESHOLD, window_index):
    """处理单个窗口的线程函数"""
    window_title = win32gui.GetWindowText(hwnd_parent)
    print(f"窗口 {window_index} ({hwnd_parent}) 开始处理 - 标题: {window_title}")
    
    try:
        while not stop_event.is_set():
            # 检查是否有消息需要处理
            if hwnd_parent in window_queues and not window_queues[hwnd_parent].empty():
                message = window_queues[hwnd_parent].get()
                if message == "STOP":
                    break
                elif message == "PAUSE":
                    # 等待继续信号
                    while not stop_event.is_set() and not window_queues[hwnd_parent].empty():
                        if window_queues[hwnd_parent].get() == "RESUME":
                            break
                        time.sleep(0.1)
            
            # 执行截图和匹配
            try:
                img, (win_left, win_top) = window_screenshot(hwnd_child)
                clicked = False

                # 遍历所有模板进行匹配
                for name, template in templates:
                    pt, top_left, size, score = find_image(img, template, CLICK_THRESHOLD)
                    if pt and score >= CLICK_THRESHOLD:
                        abs_x = pt[0]
                        abs_y = pt[1]
                        print(f"窗口 {window_index} ({hwnd_parent}) - 找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                        send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                        clicked = True
                        break  # 匹配到一个模板就点击并跳出循环

                # 控制循环速度
                if not clicked:
                    time.sleep(0.5)
                else:
                    time.sleep(0.5)  # 匹配点击后延迟
                
            except Exception as e:
                print(f"窗口 {window_index} ({hwnd_parent}) 处理错误: {e}")
                time.sleep(1.0)  # 出错后延迟更长时间再重试
    
    except Exception as e:
        print(f"窗口 {window_index} ({hwnd_parent}) 线程异常: {e}")
    
    finally:
        print(f"窗口 {window_index} ({hwnd_parent}) 停止处理")

def select_windows(hwnds):
    """让用户选择要处理的窗口"""
    if not hwnds:
        return []
    
    print("\n请选择要处理的窗口 (输入编号，用逗号分隔，或按 Enter 选择全部):")
    for i, hwnd in enumerate(hwnds):
        title = win32gui.GetWindowText(hwnd)
        print(f"{i+1}. 句柄: {hwnd}, 标题: '{title}'")
    
    while True:
        user_input = input("请输入选择: ").strip()
        if not user_input:
            return hwnds  # 选择全部
        
        try:
            selected_indices = list(map(int, user_input.split(',')))
            selected_hwnds = []
            for idx in selected_indices:
                if 1 <= idx <= len(hwnds):
                    selected_hwnds.append(hwnds[idx-1])
                else:
                    print(f"警告: 编号 {idx} 无效，已忽略")
            
            if selected_hwnds:
                return selected_hwnds
            else:
                print("错误: 未选择任何有效窗口，请重新输入")
                
        except ValueError:
            print("错误: 输入格式无效，请输入数字编号，用逗号分隔")

def main():
    global stop_event, window_queues
    
    print("微信多窗口自动化工具")
    print("=" * 50)
    
    # 获取所有微信窗口
    hwnd_parents = get_all_window_handles("Chrome_WidgetWin_0", "微信")
    if not hwnd_parents:
        return

    # 让用户选择要处理的窗口
    selected_hwnds = select_windows(hwnd_parents)
    if not selected_hwnds:
        print("未选择任何窗口，程序退出")
        return

    # 为每个选择的窗口获取子窗口
    window_pairs = []
    for i, hwnd_parent in enumerate(selected_hwnds):
        hwnd_child = get_child_window(hwnd_parent, "Intermediate D3D Window")
        if hwnd_child is not None:
            window_pairs.append((hwnd_parent, hwnd_child, i+1))
            # 创建消息队列
            window_queues[hwnd_parent] = Queue()
            print(f"窗口 {i+1}: 父窗口句柄={hwnd_parent}, 子窗口句柄={hwnd_child}")
        else:
            print(f"窗口 {i+1}: 未找到子窗口: Intermediate D3D Window")

    if not window_pairs:
        print("没有找到有效的窗口对子，程序退出")
        return

    # 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    CLICK_THRESHOLD = 0.90  # 置信度阈值

    # 创建并启动线程
    threads = []
    for hwnd_parent, hwnd_child, window_index in window_pairs:
        thread = threading.Thread(
            target=process_window,
            args=(hwnd_parent, hwnd_child, templates, CLICK_THRESHOLD, window_index),
            daemon=True
        )
        threads.append(thread)
        thread.start()
        time.sleep(0.1)  # 错开启动时间

    print("\n" + "=" * 50)
    print("所有窗口处理线程已启动")
    print("按 Q 键可以随时结束所有窗口的操作")
    print("按 P 键可以暂停所有窗口的操作")
    print("按 R 键可以恢复所有窗口的操作")
    print("=" * 50)

    # 主循环 - 监听键盘事件
    try:
        paused = False
        while True:
            if keyboard.is_pressed('q'):
                print("\n检测到 Q 键，正在停止所有窗口操作...")
                stop_event.set()
                break
            
            if keyboard.is_pressed('p') and not paused:
                print("\n检测到 P 键，暂停所有窗口操作")
                paused = True
                for hwnd in window_queues:
                    window_queues[hwnd].put("PAUSE")
                time.sleep(0.5)  # 防止重复触发
            
            if keyboard.is_pressed('r') and paused:
                print("\n检测到 R 键，恢复所有窗口操作")
                paused = False
                for hwnd in window_queues:
                    window_queues[hwnd].put("RESUME")
                time.sleep(0.5)  # 防止重复触发
            
            time.sleep(0.1)
    
    except KeyboardInterrupt:
        print("\n检测到键盘中断，正在停止所有窗口操作...")
        stop_event.set()
    
    finally:
        # 等待所有线程结束
        print("等待所有窗口处理线程结束...")
        for thread in threads:
            thread.join(timeout=5.0)
        
        print("所有窗口处理线程已结束")
        print("程序已退出")

if __name__ == "__main__":
    main()
