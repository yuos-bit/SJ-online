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
import threading
from queue import Queue

# ---------------------- 系统兼容性核心处理 ----------------------
def get_windows_version():
    version = sys.getwindowsversion()
    return (version.major, version.minor)

win_version = get_windows_version()
if win_version >= (6, 2):
    PW_RENDERFULLCONTENT = 2
else:
    PW_RENDERFULLCONTENT = 0
    print("检测到Windows 7或更早版本，启用兼容模式")

user32 = ctypes.windll.user32

# 全局控制变量
stop_event = threading.Event()
window_queues = {}

# ---------------------- 窗口操作函数 ----------------------
def get_all_window_handles(class_name, title_prefix):
    """匹配以指定前缀开头的窗口标题（适配"世界OL - XX"格式）"""
    hwnds = []
    
    def callback(hwnd, lparam):
        if win32gui.IsWindowVisible(hwnd):
            window_title = win32gui.GetWindowText(hwnd)
            window_class = win32gui.GetClassName(hwnd)
            # 类名精确匹配，标题以指定前缀开头
            class_match = (class_name == "*" or window_class == class_name)
            title_match = window_title.startswith(title_prefix)  # 关键修改：前缀匹配
            if class_match and title_match and window_title:
                hwnds.append(hwnd)
    
    win32gui.EnumWindows(callback, None)
    
    if not hwnds:
        print(f"未找到匹配窗口: 类名={class_name} / 标题前缀={title_prefix}")
    else:
        print(f"找到 {len(hwnds)} 个匹配窗口（标题以'{title_prefix}'开头）")
        for i, hwnd in enumerate(hwnds):
            print(f"窗口 {i+1}: 句柄={hwnd}, 标题='{win32gui.GetWindowText(hwnd)}'")
    
    return hwnds

def get_window_rect(hwnd):
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    return (left, top, right - left, bottom - top)

# ---------------------- 截图与图像处理函数 ----------------------
def print_window(hwnd, hdc):
    try:
        if win_version < (6, 2):
            win32gui.RedrawWindow(hwnd, None, None, win32con.RDW_INVALIDATE | win32con.RDW_UPDATENOW)
            time.sleep(0.05)
        return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)
    except Exception as e:
        print(f"[截图API异常] PrintWindow调用失败: {e}")
        return 0

def window_screenshot(hwnd, save_debug=True):
    left, top, width, height = get_window_rect(hwnd)
    print(f"[截图信息] 窗口句柄={hwnd}，尺寸={width}x{height}，位置=({left},{top})")

    original_style = None
    if win_version < (6, 2):
        original_style = win32gui.GetWindowLong(hwnd, win32con.GWL_EXSTYLE)
        if not win32gui.IsWindowVisible(hwnd):
            win32gui.ShowWindow(hwnd, win32con.SW_SHOWNA)
            time.sleep(0.1)

    hdc_window = win32gui.GetWindowDC(hwnd)
    hdc_mem = win32ui.CreateDCFromHandle(hdc_window)
    compatibleDC = hdc_mem.CreateCompatibleDC()
    bmp = win32ui.CreateBitmap()
    bmp.CreateCompatibleBitmap(hdc_mem, width, height)
    compatibleDC.SelectObject(bmp)

    result = print_window(hwnd, compatibleDC.GetSafeHdc())
    if result == 0:
        print(f"[截图警告] 句柄={hwnd}截图失败，尝试BitBlt备选方案")
        if win_version < (6, 2):
            result = win32gui.BitBlt(compatibleDC.GetSafeHdc(), 0, 0, width, height,
                                    hdc_window, 0, 0, win32con.SRCCOPY)

    bmpinfo = bmp.GetInfo()
    bmpstr = bmp.GetBitmapBits(True)
    img = np.frombuffer(bmpstr, dtype=np.uint8).reshape(
        (bmpinfo['bmHeight'], bmpinfo['bmWidth'], 4)
    )
    img = cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)

    if save_debug:
        debug_filename = f"debug_screenshot_{hwnd}.jpg"
        cv2.imwrite(debug_filename, img)
        print(f"[调试文件] 已保存截图为 {debug_filename}")

    if win_version < (6, 2) and original_style is not None:
        win32gui.SetWindowLong(hwnd, win32con.GWL_EXSTYLE, original_style)
    win32gui.DeleteObject(bmp.GetHandle())
    compatibleDC.DeleteDC()
    hdc_mem.DeleteDC()
    win32gui.ReleaseDC(hwnd, hdc_window)

    return img, (left, top)

def load_templates(script_dir):
    jpg_dir = os.path.join(script_dir, "jpg-2")
    if not os.path.exists(jpg_dir):
        print(f"[模板加载] 未找到模板目录: {jpg_dir}")
        return []
    
    templates = []
    for f in os.listdir(jpg_dir):
        if f.lower().endswith((".jpg", ".png")):
            path = os.path.join(jpg_dir, f)
            img = cv2.imread(path, cv2.IMREAD_COLOR)
            if img is not None:
                h, w = img.shape[:2]
                templates.append((f, img))
                print(f"[模板加载] 成功加载: {f} (尺寸: {w}x{h})")
    
    if not templates:
        print("[模板加载] 模板目录中未找到有效图片")
    return templates

def find_image(target, template, template_name, threshold=0.7):
    h, w = template.shape[:2]
    print(f"[匹配过程] 模板={template_name} (尺寸: {w}x{h})")

    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    print(f"[匹配结果] 模板={template_name} 最高置信度={max_val:.3f} (阈值={threshold})")

    if max_val >= threshold:
        center_x = max_loc[0] + w // 2
        center_y = max_loc[1] + h // 2
        marked_img = target.copy()
        cv2.rectangle(marked_img, max_loc, (max_loc[0]+w, max_loc[1]+h), (0,255,0), 2)
        cv2.putText(marked_img, f"{template_name} ({max_val:.3f})", 
                   (max_loc[0], max_loc[1]-10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0,255,0), 1)
        matched_filename = f"matched_result_{template_name}_{hwnd}.jpg"
        cv2.imwrite(matched_filename, marked_img)
        print(f"[匹配成功] 模板={template_name}，中心坐标=({center_x},{center_y})，已保存匹配图为 {matched_filename}")
        return (center_x, center_y), max_loc, (w, h), max_val
    return None, None, None, max_val

# ---------------------- 点击事件处理 ----------------------
def send_click(hwnd, x, y):
    try:
        left, top, width, height = get_window_rect(hwnd)
        if x < 0 or x >= width or y < 0 or y >= height:
            print(f"[坐标调整] 坐标({x},{y})超出窗口范围，已自动调整")
            x = max(0, min(x, width-1))
            y = max(0, min(y, height-1))
        
        lParam = win32api.MAKELONG(x, y)
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.03)
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, 0, lParam)
        print(f"[点击事件] 窗口句柄={hwnd}，点击坐标=({x},{y})")
        return True
    except Exception as e:
        print(f"[点击异常] 窗口句柄={hwnd} 点击失败: {e}")
        return False

# ---------------------- 多窗口线程处理 ----------------------
def process_window(hwnd, templates, config, window_index):
    window_title = win32gui.GetWindowText(hwnd)
    threshold = config["threshold"]
    check_interval = config["check_interval"]
    click_delay = config["click_delay"]
    
    print(f"\n[线程启动] 窗口 {window_index} 开始处理 - 句柄={hwnd}，标题='{window_title}'")
    print(f"[线程配置] 阈值={threshold}，检测间隔={check_interval}s，点击延迟={click_delay}s")
    
    try:
        while not stop_event.is_set():
            if hwnd in window_queues and not window_queues[hwnd].empty():
                message = window_queues[hwnd].get()
                if message == "STOP":
                    print(f"[线程停止] 窗口 {window_index} (句柄={hwnd}) 收到停止信号")
                    break
                elif message == "PAUSE":
                    print(f"[线程暂停] 窗口 {window_index} (句柄={hwnd}) 收到暂停信号")
                    while not stop_event.is_set():
                        if not window_queues[hwnd].empty():
                            if window_queues[hwnd].get() == "RESUME":
                                print(f"[线程恢复] 窗口 {window_index} (句柄={hwnd}) 收到恢复信号")
                                break
                        time.sleep(0.1)
            
            try:
                target_img, (win_left, win_top) = window_screenshot(hwnd)
                matched = False

                for template_name, template_img in templates:
                    center_pt, _, _, score = find_image(
                        target_img, template_img, template_name, threshold
                    )

                    if center_pt:
                        click_x, click_y = center_pt
                        send_click(hwnd, click_x, click_y)
                        matched = True
                        time.sleep(click_delay)
                        break

                if not matched:
                    print(f"[匹配状态] 窗口 {window_index} (句柄={hwnd}) 未匹配到任何模板")
                    time.sleep(check_interval)
            
            except Exception as e:
                print(f"[线程异常] 窗口 {window_index} (句柄={hwnd}) 处理错误: {str(e)}")
                time.sleep(1.0)
    
    except Exception as e:
        print(f"[线程崩溃] 窗口 {window_index} (句柄={hwnd}) 线程异常: {str(e)}")
    
    finally:
        print(f"[线程结束] 窗口 {window_index} (句柄={hwnd}) 停止处理")

def select_windows(hwnds):
    if not hwnds:
        return []
    
    print("\n" + "="*60)
    print("请选择要处理的窗口 (输入编号，用逗号分隔，直接按Enter选择全部):")
    print("="*60)
    for i, hwnd in enumerate(hwnds):
        title = win32gui.GetWindowText(hwnd)
        print(f"{i+1}. 句柄: {hwnd}, 标题: '{title}'")
    
    while True:
        user_input = input("\n请输入选择: ").strip()
        if not user_input:
            print("已选择全部窗口")
            return hwnds
        
        try:
            selected_indices = list(map(int, user_input.split(',')))
            selected_hwnds = []
            for idx in selected_indices:
                if 1 <= idx <= len(hwnds):
                    selected_hwnds.append(hwnds[idx-1])
                else:
                    print(f"警告: 编号 {idx} 无效，已忽略")
            
            if selected_hwnds:
                print(f"\n已选择 {len(selected_hwnds)} 个窗口:")
                for hwnd in selected_hwnds:
                    print(f"- 句柄={hwnd}, 标题='{win32gui.GetWindowText(hwnd)}'")
                return selected_hwnds
            else:
                print("错误: 未选择任何有效窗口，请重新输入")
                
        except ValueError:
            print("错误: 输入格式无效，请输入数字编号（用逗号分隔）")

# ---------------------- 主程序 ----------------------
def main():
    config = {
        "class_name": "Chrome_WidgetWin_1",
        "title_prefix": "世界OL - ",  # 关键修改：匹配所有以"世界OL - "开头的标题
        "threshold": 0.7,
        "check_interval": 0.3,
        "click_delay": 0.5
    }

    print("Windows 7兼容多窗口自动化工具")
    print("="*60)
    print(f"配置参数: 阈值={config['threshold']}, 检测间隔={config['check_interval']}s")
    print(f"窗口匹配规则: 类名={config['class_name']}, 标题以'{config['title_prefix']}'开头")
    print("="*60)

    # 1. 获取所有匹配窗口（标题以指定前缀开头）
    hwnd_list = get_all_window_handles(config["class_name"], config["title_prefix"])
    if not hwnd_list:
        print("无匹配窗口，程序退出")
        return

    # 2. 用户选择窗口
    selected_hwnds = select_windows(hwnd_list)
    if not selected_hwnds:
        print("未选择任何窗口，程序退出")
        return

    # 3. 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        print("无可用模板，程序退出")
        return

    # 4. 初始化窗口队列
    for hwnd in selected_hwnds:
        window_queues[hwnd] = Queue()

    # 5. 启动线程
    threads = []
    for i, hwnd in enumerate(selected_hwnds):
        thread = threading.Thread(
            target=process_window,
            args=(hwnd, templates, config, i+1),
            daemon=True
        )
        threads.append(thread)
        thread.start()
        time.sleep(0.1)

    # 6. 键盘控制
    print("\n" + "="*60)
    print("操作说明:")
    print("  Q 键: 停止所有窗口操作，退出程序")
    print("  P 键: 暂停所有窗口操作")
    print("  R 键: 恢复所有窗口操作")
    print("="*60)

    try:
        paused = False
        while True:
            if keyboard.is_pressed('q'):
                print("\n[全局控制] 检测到 Q 键，正在停止所有线程...")
                stop_event.set()
                for hwnd in window_queues:
                    window_queues[hwnd].put("STOP")
                break
            
            if keyboard.is_pressed('p') and not paused:
                print("\n[全局控制] 检测到 P 键，暂停所有线程...")
                paused = True
                for hwnd in window_queues:
                    window_queues[hwnd].put("PAUSE")
                time.sleep(0.5)
            
            if keyboard.is_pressed('r') and paused:
                print("\n[全局控制] 检测到 R 键，恢复所有线程...")
                paused = False
                for hwnd in window_queues:
                    window_queues[hwnd].put("RESUME")
                time.sleep(0.5)
            
            time.sleep(0.1)
    
    except KeyboardInterrupt:
        print("\n[全局控制] 检测到键盘中断，正在停止所有线程...")
        stop_event.set()
        for hwnd in window_queues:
            window_queues[hwnd].put("STOP")
    
    finally:
        print("\n[全局控制] 等待所有线程结束...")
        for thread in threads:
            thread.join(timeout=5.0)
        
        print("\n所有线程已结束，程序退出")

if __name__ == "__main__":
    main()