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
    从父窗口中查找指定类名和标题的子窗口（基础版，无重试）
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

# ---------------------- 新增：带重试的子窗口查找函数 ----------------------
def get_child_window_with_retry(hwnd_parent, target_class, target_title=None, max_retry=3, delay=0.1):
    """
    带重试的子窗口查找（解决后台窗口枚举延迟问题）
    :param hwnd_parent: 父窗口句柄
    :param target_class: 子窗口类名（精确匹配，你确认的Chrome子窗口类名）
    :param target_title: 子窗口标题（精确匹配，你确认的Chrome子窗口标题）
    :param max_retry: 最大重试次数（默认3次）
    :param delay: 每次重试间隔（默认0.1秒）
    :return: 找到的子窗口句柄，未找到返回None
    """
    for retry_count in range(1, max_retry + 1):
        child_hwnds = []
        # 回调函数：枚举父窗口下的所有同级子窗口
        def callback(child_hwnd, lparam):
            if win32gui.GetClassName(child_hwnd) == target_class:
                if target_title is None or win32gui.GetWindowText(child_hwnd) == target_title:
                    child_hwnds.append(child_hwnd)
        win32gui.EnumChildWindows(hwnd_parent, callback, None)
        
        if child_hwnds:
            print(f"第{retry_count}次尝试成功：找到子窗口 | 句柄={child_hwnds[0]} | 类名={target_class} | 标题={target_title}")
            return child_hwnds[0]
        else:
            print(f"第{retry_count}次尝试失败：未找到子窗口，{delay}秒后重试...")
            time.sleep(delay)
    
    # 所有重试都失败
    print(f"重试{max_retry}次后仍未找到子窗口：父窗口句柄={hwnd_parent} | 目标类名={target_class} | 目标标题={target_title}")
    return None
# --------------------------------------------------------------------------

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
    """加载模板图片（支持jpg/png，按文件名数字顺序排序）"""
    jpg_dir = os.path.join(script_dir, "jpg-1")  # 模板目录适配
    if not os.path.exists(jpg_dir):
        print(f"未找到模板目录: {jpg_dir}")
        return []
    
    templates = []
    # 筛选图片文件并按文件名数字排序（支持1.jpg < 2.jpg < 10.jpg）
    img_files = sorted(
        [f for f in os.listdir(jpg_dir) if f.lower().endswith((".jpg", ".png"))],
        key=lambda x: int(os.path.splitext(x)[0]) if os.path.splitext(x)[0].isdigit() else x
    )
    
    for f in img_files:
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
        print(f"已向窗口发送点击: 句柄={hwnd} | 坐标({x},{y})")
    except Exception as e:
        print(f"窗口点击失败: 句柄={hwnd} | 错误={e}")

def main():
    """主函数：按模板顺序执行，循环往复"""
    # 1. 获取Chrome父窗口（你确认的类名和标题，无需修改）
    hwnd_level1 = get_window_handle("Chrome_WidgetWin_1", "世界OL - 墨✨惊鸿 - Google Chrome")
    if hwnd_level1 == 0:
        return

    # 2. 带重试的子窗口查找（针对后台枚举延迟）
    hwnd_target = get_child_window_with_retry(
        hwnd_parent=hwnd_level1,
        target_class="Chrome_RenderWidgetHostHWND",
        target_title="Chrome Legacy Window",
        max_retry=3,
        delay=0.1
    )
    # 降级方案：子窗口找不到时用父窗口
    if hwnd_target is None:
        hwnd_target = hwnd_level1
        print("已切换为父窗口模式（不影响截图和点击功能）")

    # 3. 加载模板（按数字顺序）
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return
    total_templates = len(templates)
    current_index = 0  # 当前执行的模板索引（从0开始）
    total_rounds = 0  # 已完成的完整轮数

    # 4. 配置参数
    CLICK_THRESHOLD = 0.90
    MAX_RETRIES_PER_TEMPLATE = 45  # 单个模板最大重试次数（快速匹配）
    RETRY_INTERVAL = 0.3  # 重试间隔（秒）
    AFTER_CLICK_DELAY = 0.3  # 点击后切换下一个模板的延迟

    print(f"\n开始按顺序执行模板（共{total_templates}个），按 Q 键结束脚本")
    print(f"配置：匹配阈值={CLICK_THRESHOLD} | 单模板重试={MAX_RETRIES_PER_TEMPLATE}次 | 点击后延迟={AFTER_CLICK_DELAY}秒")

    while True:
        if keyboard.is_pressed('q'):
            print(f"\n脚本已结束 | 已完成{total_rounds}轮 | 当前执行到第{current_index+1}个模板")
            break

        # 获取当前要执行的模板
        template_name, template_img = templates[current_index]
        retry_count = 0
        matched = False

        # 单个模板多次重试匹配（确保界面加载完成）
        while retry_count < MAX_RETRIES_PER_TEMPLATE:
            # 每次重试都重新截图（获取最新界面）
            img, (win_left, win_top) = window_screenshot(hwnd_target)
            center_pt, _, _, score = find_image(img, template_img, CLICK_THRESHOLD)

            if center_pt and score >= CLICK_THRESHOLD:
                # 匹配成功，执行点击
                click_x, click_y = center_pt
                print(f"\n✅ 找到目标[{current_index+1}/{total_templates}]: {template_name} | 置信度={score:.2f} | 坐标({click_x},{click_y})")
                send_click(hwnd_target, click_x, click_y)
                matched = True
                break
            else:
                # 每5次重试打印一次日志（避免刷屏）
                if retry_count % 5 == 0:
                    print(f"🔍 重试[{retry_count}/{MAX_RETRIES_PER_TEMPLATE}] 目标[{current_index+1}/{total_templates}]: {template_name} | 最高置信度={score:.2f}")
                retry_count += 1
                time.sleep(RETRY_INTERVAL)

        # 处理匹配结果，切换到下一个模板
        if matched:
            # 切换索引
            current_index += 1
            # 完成一轮后重置索引，统计轮数
            if current_index >= total_templates:
                current_index = 0
                total_rounds += 1
                print(f"\n🎉 完成第{total_rounds}轮所有模板")
            # 点击后延迟，给界面加载时间
            time.sleep(AFTER_CLICK_DELAY)
        else:
            # 重试多次仍未匹配，跳过该模板（避免卡死）
            print(f"\n❌ 目标[{current_index+1}/{total_templates}]: {template_name} 重试{MAX_RETRIES_PER_TEMPLATE}次仍未找到，跳过并切换下一个")
            current_index += 1
            if current_index >= total_templates:
                current_index = 0
                total_rounds += 1
                print(f"\n⚠️  第{total_rounds}轮存在未匹配模板，进入下一轮")
            time.sleep(0.3)

if __name__ == "__main__":
    main()