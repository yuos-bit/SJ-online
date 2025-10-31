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

# ---------------------- 系统兼容性处理 ----------------------
def get_windows_version():
    """获取Windows版本信息用于兼容性处理"""
    version = sys.getwindowsversion()
    return (version.major, version.minor)

# 根据系统版本设置渲染参数
win_version = get_windows_version()
if win_version >= (6, 2):  # Windows 8及以上
    PW_RENDERFULLCONTENT = 2
else:  # Windows 7及以下
    PW_RENDERFULLCONTENT = 0
    print("检测到Windows 7或更早版本，启用兼容模式")

user32 = ctypes.windll.user32

# ---------------------- 窗口操作相关函数 ----------------------
def get_window_handle(class_name, title):
    """根据类名和标题获取窗口句柄"""
    hwnd = win32gui.FindWindow(class_name, title)
    if hwnd == 0:
        print(f"未找到窗口: 类名={class_name} / 标题={title}")
    else:
        print(f"找到父窗口: 句柄={hwnd} | 类名={class_name} | 标题={title}")
    return hwnd

def get_window_rect(hwnd):
    """获取窗口位置和尺寸"""
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    return (left, top, right - left, bottom - top)  # (left, top, width, height)

# ---------------------- 截图与图像处理 ----------------------
def print_window(hwnd, hdc):
    """调用系统API捕获窗口内容，兼容不同Windows版本"""
    try:
        if win_version < (6, 2):  # Windows 7特殊处理
            win32gui.RedrawWindow(hwnd, None, None, win32con.RDW_INVALIDATE | win32con.RDW_UPDATENOW)
            time.sleep(0.05)  # 等待窗口重绘
        return user32.PrintWindow(hwnd, hdc, PW_RENDERFULLCONTENT)
    except Exception as e:
        print(f"PrintWindow调用失败: {e}")
        return 0

def window_screenshot(hwnd, save_debug=True):
    """捕获窗口截图并转换为OpenCV格式，可选保存调试图片"""
    left, top, width, height = get_window_rect(hwnd)
    print(f"截取父窗口: 句柄={hwnd}, 尺寸={width}x{height}, 位置=({left},{top})")

    # Windows 7窗口可见性处理
    original_style = None
    if win_version < (6, 2):
        original_style = win32gui.GetWindowLong(hwnd, win32con.GWL_EXSTYLE)
        if not win32gui.IsWindowVisible(hwnd):
            win32gui.ShowWindow(hwnd, win32con.SW_SHOWNA)  # 显示但不激活
            time.sleep(0.1)

    # 创建设备上下文
    hdc_window = win32gui.GetWindowDC(hwnd)
    hdc_mem = win32ui.CreateDCFromHandle(hdc_window)
    compatibleDC = hdc_mem.CreateCompatibleDC()
    bmp = win32ui.CreateBitmap()
    bmp.CreateCompatibleBitmap(hdc_mem, width, height)
    compatibleDC.SelectObject(bmp)

    # 执行截图
    result = print_window(hwnd, compatibleDC.GetSafeHdc())
    if result == 0:
        print("截图失败，尝试备选方案...")
        if win_version < (6, 2):
            result = win32gui.BitBlt(compatibleDC.GetSafeHdc(), 0, 0, width, height,
                                    hdc_window, 0, 0, win32con.SRCCOPY)

    # 转换为OpenCV图像
    bmpinfo = bmp.GetInfo()
    bmpstr = bmp.GetBitmapBits(True)
    img = np.frombuffer(bmpstr, dtype=np.uint8).reshape(
        (bmpinfo['bmHeight'], bmpinfo['bmWidth'], 4)
    )
    img = cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)

    # 保存调试截图
    if save_debug:
        cv2.imwrite("latest_screenshot.jpg", img)
        print("已保存最新截图为 latest_screenshot.jpg")

    # 恢复窗口状态并释放资源
    if win_version < (6, 2) and original_style is not None:
        win32gui.SetWindowLong(hwnd, win32con.GWL_EXSTYLE, original_style)
    win32gui.DeleteObject(bmp.GetHandle())
    compatibleDC.DeleteDC()
    hdc_mem.DeleteDC()
    win32gui.ReleaseDC(hwnd, hdc_window)

    return img, (left, top)

def load_templates(script_dir):
    """加载模板图片并返回列表"""
    jpg_dir = os.path.join(script_dir, "jpg-2")
    if not os.path.exists(jpg_dir):
        print(f"模板目录不存在: {jpg_dir}")
        return []
    
    templates = []
    for f in os.listdir(jpg_dir):
        if f.lower().endswith((".jpg", ".png")):
            path = os.path.join(jpg_dir, f)
            img = cv2.imread(path, cv2.IMREAD_COLOR)
            if img is not None:
                h, w = img.shape[:2]
                templates.append((f, img))
                print(f"加载模板: {f} (尺寸: {w}x{h})")
    
    if not templates:
        print("模板目录中未找到有效图片")
    return templates

def find_image(target, template, template_name, threshold=0.7):
    """模板匹配并返回结果，输出详细调试信息"""
    h, w = template.shape[:2]
    print(f"匹配模板: {template_name} (尺寸: {w}x{h})")

    # 执行模板匹配
    res = cv2.matchTemplate(target, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    print(f"模板 {template_name} 最高置信度: {max_val:.3f} (阈值: {threshold})")

    if max_val >= threshold:
        center_x = max_loc[0] + w // 2
        center_y = max_loc[1] + h // 2
        # 绘制匹配框并保存
        marked_img = target.copy()
        cv2.rectangle(marked_img, max_loc, (max_loc[0]+w, max_loc[1]+h), (0,255,0), 2)
        cv2.putText(marked_img, f"{template_name} ({max_val:.3f})", 
                   (max_loc[0], max_loc[1]-10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0,255,0), 1)
        cv2.imwrite("matched_result.jpg", marked_img)
        print(f"匹配成功！中心坐标: ({center_x},{center_y})，已保存匹配结果为 matched_result.jpg")
        return (center_x, center_y), max_loc, (w, h), max_val
    return None, None, None, max_val

# ---------------------- 点击事件处理 ----------------------
def send_click(hwnd, x, y):
    """向父窗口发送鼠标点击事件"""
    try:
        # 确保坐标在窗口范围内
        left, top, width, height = get_window_rect(hwnd)
        if x < 0 or x >= width or y < 0 or y >= height:
            print(f"坐标({x},{y})超出窗口范围，已自动调整")
            x = max(0, min(x, width-1))
            y = max(0, min(y, height-1))
        
        lParam = win32api.MAKELONG(x, y)
        # 发送鼠标按下和释放事件
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.03)  # 模拟按键延迟
        win32api.SendMessage(hwnd, win32con.WM_LBUTTONUP, 0, lParam)
        print(f"向父窗口发送点击: 句柄={hwnd}, 坐标=({x},{y})")
        return True
    except Exception as e:
        print(f"父窗口点击失败: 句柄={hwnd}, 错误={e}")
        return False

# ---------------------- 主程序 ----------------------
def main():
    # 1. 配置参数
    TEMPLATE_THRESHOLD = 0.7  # 模板匹配阈值（可根据调试结果调整）
    CHECK_INTERVAL = 0.3  # 检测间隔（秒）
    CLICK_DELAY = 0.5  # 点击后延迟（秒）

    # 2. 获取父窗口句柄（仅使用父窗口）
    hwnd_parent = get_window_handle("Chrome_WidgetWin_1", "世界OL - 流星 - Google Chrome")
    if hwnd_parent == 0:
        print("无法获取父窗口，程序退出")
        return

    # 3. 加载模板
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        print("无可用模板，程序退出")
        return

    # 4. 开始检测循环（仅使用父窗口）
    print(f"\n开始检测（仅使用父窗口，阈值: {TEMPLATE_THRESHOLD}），按 Q 键停止")
    print("-" * 60)

    try:
        while True:
            if keyboard.is_pressed('q'):
                print("\n用户终止程序")
                break

            # 截取父窗口图像
            target_img, (win_left, win_top) = window_screenshot(hwnd_parent)
            matched = False

            # 匹配所有模板
            for template_name, template_img in templates:
                center_pt, _, _, score = find_image(
                    target_img, template_img, template_name, TEMPLATE_THRESHOLD
                )

                if center_pt:
                    click_x, click_y = center_pt
                    # 仅向父窗口发送点击（坐标基于父窗口）
                    send_click(hwnd_parent, click_x, click_y)
                    
                    matched = True
                    time.sleep(CLICK_DELAY)  # 点击后延迟
                    break  # 匹配到一个后暂停检测

            if not matched:
                print("未匹配到任何模板，继续检测...")
            time.sleep(CHECK_INTERVAL)

    except Exception as e:
        print(f"程序出错: {str(e)}")

    print("程序结束")

if __name__ == "__main__":
    main()