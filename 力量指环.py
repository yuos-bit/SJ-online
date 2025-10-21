import cv2
import numpy as np
import time
import os
<<<<<<< Updated upstream
=======
import re  # 用于提取文件名中的数字进行排序
>>>>>>> Stashed changes
import win32gui
import win32ui
import win32con
import win32api
import sys
import ctypes
<<<<<<< Updated upstream
import keyboard  # 监听按键

=======
import keyboard  # 用于监听按键事件

# PrintWindow渲染参数，确保完整截图
>>>>>>> Stashed changes
PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

def print_window(hwnd, hdc):
<<<<<<< Updated upstream
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
=======
    """调用系统API捕获窗口内容"""
    return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)

def get_window_handle(class_name, title):
    """根据类名和标题获取窗口句柄（精确匹配）"""
    hwnd = win32gui.FindWindow(class_name, title)
    if hwnd == 0:
        print(f"未找到窗口: 类名={class_name} / 标题={title}")
    else:
        print(f"找到窗口: 句柄={hwnd} | 类名={class_name} | 标题={title}")
    return hwnd

def get_child_window(hwnd_parent, target_class, target_title=None):
    """从父窗口中查找指定类名和标题的子窗口"""
    child_hwnds = []
    def callback(child_hwnd, lparam):
        if win32gui.GetClassName(child_hwnd) == target_class:
            if target_title is None or win32gui.GetWindowText(child_hwnd) == target_title:
                child_hwnds.append(child_hwnd)
    win32gui.EnumChildWindows(hwnd_parent, callback, None)
    if child_hwnds:
        print(f"找到子窗口: 句柄={child_hwnds[0]} | 类名={target_class} | 标题={target_title or '不校验'}")
        return child_hwnds[0]
    print(f"未找到子窗口: 父窗口句柄={hwnd_parent} | 目标类名={target_class} | 目标标题={target_title or '不校验'}")
    return None

def window_screenshot(hwnd):
    """对指定窗口截图，返回OpenCV图像和窗口左上角坐标"""
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        print(f"警告: PrintWindow 截图失败 hwnd={hwnd}")
=======
        print(f"警告: 截图失败，窗口句柄={hwnd}")
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
def load_templates(script_dir):
    """按文件名数字顺序加载模板（如1.jpg、2.jpg...）"""
    jpg_dir = os.path.join(script_dir, "jpg2")
    if not os.path.exists(jpg_dir):
        print(f"未找到 jpg2 目录: {jpg_dir}")
        return []
    # 按文件名中的数字排序（支持1.jpg < 2.jpg < 10.jpg）
    jpg_files = sorted(
        [f for f in os.listdir(jpg_dir) if f.lower().endswith(".jpg")],
        key=lambda x: int(os.path.splitext(x)[0]) if os.path.splitext(x)[0].isdigit() else x
    )
    templates = []
    for f in jpg_files:
=======
def natural_sort_key(s):
    """自然排序键（支持文件名中的数字顺序，如1.jpg < 2.jpg < 10.jpg）"""
    return [int(text) if text.isdigit() else text.lower() for text in re.split('(\d+)', s)]

def load_templates(script_dir):
    """加载模板图片（按文件名自然排序）"""
    jpg_dir = os.path.join(script_dir, "jpg-2")  # 模板目录
    if not os.path.exists(jpg_dir):
        print(f"未找到模板目录: {jpg_dir}")
        return []
    
    # 获取目录下所有图片文件并按自然顺序排序
    image_files = [f for f in os.listdir(jpg_dir) if f.lower().endswith((".jpg", ".png"))]
    image_files.sort(key=natural_sort_key)  # 按文件名自然排序（支持数字顺序）
    
    templates = []
    for f in image_files:
>>>>>>> Stashed changes
        path = os.path.join(jpg_dir, f)
        img = cv2.imread(path, cv2.IMREAD_COLOR)
        if img is not None:
            templates.append((f, img))
<<<<<<< Updated upstream
            print(f"加载模板成功: {path}")
    if not templates:
        print("jpg2目录下没有可用的模板图片")
    return templates

def find_image(target, template, threshold=0.7):
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
=======
            print(f"加载模板（顺序={len(templates)}）: {path}")
    
    if not templates:
        print("模板目录(jpg-2)下没有可用的图片")
    return templates

def find_image(target, template, threshold=0.7):
    """模板匹配，返回中心坐标和置信度"""
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    
>>>>>>> Stashed changes
    if max_val >= threshold:
        h, w = template.shape[:2]
        center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
        return center, max_loc, (w, h), max_val
    return None, None, None, max_val

<<<<<<< Updated upstream
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
    # 顶层父窗口：Qt5156QWindowIcon / MuMu安卓设备
    hwnd_parent = get_window_handle("Qt5156QWindowIcon", "MuMu安卓设备")
    if hwnd_parent == 0:
        return

    # 第一层子窗口：Qt5156QWindowIcon / MuMuNxDevice
    hwnd_child = get_child_window(hwnd_parent, "Qt5156QWindowIcon", "MuMuNxDevice")
    if hwnd_child is None:
        print("未找到子窗口: Qt5156QWindowIcon / MuMuNxDevice")
        return
    else:
        print(f"找到父窗口句柄: {hwnd_parent}，子窗口句柄: {hwnd_child}")

    # 2. 加载模板（按顺序）
=======
def send_click(hwnd, x, y):
    """向目标窗口发送点击事件"""
    lParam = win32api.MAKELONG(x, y)
    try:
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.03)  # 模拟按下延迟
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, None, lParam)
        print(f"已发送点击: 句柄={hwnd} | 坐标({x},{y})")
    except Exception as e:
        print(f"点击失败: 句柄={hwnd} | 错误={e}")

def main():
    """主函数：按模板文件名顺序依次匹配并点击"""
    # 1. 获取顶层父窗口和第一层子窗口
    hwnd_level1 = get_window_handle("Qt5156QWindowIcon", "MuMu安卓设备")
    if hwnd_level1 == 0:
        return

    hwnd_target = get_child_window(hwnd_level1, "Qt5156QWindowIcon", "MuMuNxDevice")
    if hwnd_target is None:
        return

    # 2. 加载模板（按文件名顺序）
>>>>>>> Stashed changes
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

<<<<<<< Updated upstream
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
=======
    CLICK_THRESHOLD = 0.90  # 匹配置信度阈值
    print("\n开始按顺序检测模板，找到即点击...")
    print("按 Q 键结束脚本")

    while True:
        if keyboard.is_pressed('q'):
            print("脚本已结束")
            break

        # 对目标窗口截图
        img, (win_left, win_top) = window_screenshot(hwnd_target)
        
        # 3. 按模板顺序依次匹配（不再break，全部检查）
        for idx, (name, template) in enumerate(templates, 1):  # idx为顺序编号
            center_pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
            if center_pt and score >= CLICK_THRESHOLD:
                click_x, click_y = center_pt
                print(f"找到第{idx}个模板: {name} | 置信度: {score:.2f} | 坐标: ({click_x},{click_y})")
                send_click(hwnd_target, click_x, click_y)
                time.sleep(0.5)  # 每个点击后稍等，避免过快

        # 一轮模板检查后等待0.5秒再开始下一轮
        time.sleep(0.5)
>>>>>>> Stashed changes

if __name__ == "__main__":
    main()