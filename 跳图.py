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
import keyboard  # 用于监听按键事件

# PrintWindow渲染参数，确保完整截图
PW_RENDERFULLCONTENT = 2
user32 = ctypes.windll.user32

def print_window(hwnd, hdc):
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
    """
    从父窗口中查找指定类名和标题的子窗口
    :param hwnd_parent: 父窗口句柄
    :param target_class: 子窗口类名（精确匹配）
    :param target_title: 子窗口标题（精确匹配，None则不校验标题）
    :return: 找到的子窗口句柄，未找到返回None
    """
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
        print(f"警告: 截图失败，窗口句柄={hwnd}")

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
    """加载模板图片（支持jpg/png）"""
    jpg_dir = os.path.join(script_dir, "jpg-1")  # 模板目录适配
    if not os.path.exists(jpg_dir):
        print(f"未找到模板目录: {jpg_dir}")
        return []
    
    templates = []
    for f in os.listdir(jpg_dir):
        if f.lower().endswith((".jpg", ".png")):
            path = os.path.join(jpg_dir, f)
            img = cv2.imread(path, cv2.IMREAD_COLOR)
            if img is not None:
                templates.append((f, img))
                print(f"加载模板成功: {path}")
    
    if not templates:
        print("模板目录(jpg-1)下没有可用的图片")
    return templates

def find_image(target, template, threshold=0.7):
    """模板匹配，返回中心坐标和置信度"""
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    
    if max_val >= threshold:
        h, w = template.shape[:2]
        center = (max_loc[0] + w // 2, max_loc[1] + h // 2)
        return center, max_loc, (w, h), max_val
    return None, None, None, max_val

def send_click(hwnd, x, y):
    """向目标窗口发送点击事件（仅针对第一层子窗口）"""
    lParam = win32api.MAKELONG(x, y)  # 基于第一层子窗口的相对坐标
    try:
        # 发送左键按下+释放事件
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.03)  # 模拟按下延迟
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, None, lParam)
        print(f"已向第一层子窗口发送点击: 句柄={hwnd} | 坐标({x},{y})")
    except Exception as e:
        print(f"第一层子窗口点击失败: 句柄={hwnd} | 错误={e}")

def main():
    """主函数：仅向第一层子窗口发送点击"""
    # 1. 顶层父窗口：LDPlayerMainFrame / 王惊梦
    hwnd_level1 = get_window_handle("LDPlayerMainFrame", "王惊梦")
    if hwnd_level1 == 0:
        return

    # 2. 第一层子窗口：RenderWindow / TheRender（仅向该窗口发送点击）
    hwnd_target = get_child_window(hwnd_level1, "RenderWindow", "TheRender")
    if hwnd_target is None:
        return

    # 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return

    CLICK_THRESHOLD = 0.95  # 匹配置信度阈值
    print("\n开始检测，仅向第一层子窗口发送点击...")
    print("按 Q 键结束脚本")

    while True:
        if keyboard.is_pressed('q'):
            print("脚本已结束")
            break

        # 对第一层子窗口截图（坐标基于该窗口，确保点击位置准确）
        img, (win_left, win_top) = window_screenshot(hwnd_target)
        clicked = False

        for name, template in templates:
            center_pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
            if center_pt and score >= CLICK_THRESHOLD:
                click_x, click_y = center_pt  # 相对第一层子窗口的坐标
                print(f"找到目标: {name} | 置信度: {score:.2f} | 点击坐标: ({click_x},{click_y})")
                # 仅向第一层子窗口发送点击
                send_click(hwnd_target, click_x, click_y)
                clicked = True
                break  # 匹配一个后停止

        # 控制循环间隔
        time.sleep(1 if clicked else 0.5)

if __name__ == "__main__":
    main()