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
import pyperclip  

# -------------------------- 新增：硬件级按键模拟的核心定义 --------------------------
user32 = ctypes.WinDLL('user32', use_last_error=True)

# 定义SendInput所需的常量
INPUT_KEYBOARD = 1
KEYEVENTF_KEYUP = 0x0002

# 修复结构体类型错误，匹配Windows API标准
class KEYBDINPUT(ctypes.Structure):
    _fields_ = (
        ("wVk", ctypes.c_ushort),    # 虚拟键码
        ("wScan", ctypes.c_ushort),  # 扫描码
        ("dwFlags", ctypes.c_ulong), # 按键标志
        ("time", ctypes.c_ulong),    # 时间戳
        ("dwExtraInfo", ctypes.POINTER(ctypes.c_ulong)), # 额外信息
    )

class INPUT(ctypes.Structure):
    class _INPUT(ctypes.Union):
        _fields_ = (("ki", KEYBDINPUT),)
    _anonymous_ = ("_input",)
    _fields_ = (("type", ctypes.c_ulong), ("_input", _INPUT))

# 模拟按键按下
def press_key(vk_code):
    input_obj = INPUT(
        type=INPUT_KEYBOARD,
        ki=KEYBDINPUT(
            wVk=vk_code,
            wScan=0,
            dwFlags=0,
            time=0,
            dwExtraInfo=None,
        )
    )
    user32.SendInput(1, ctypes.byref(input_obj), ctypes.sizeof(INPUT))

# 模拟按键释放
def release_key(vk_code):
    input_obj = INPUT(
        type=INPUT_KEYBOARD,
        ki=KEYBDINPUT(
            wVk=vk_code,
            wScan=0,
            dwFlags=KEYEVENTF_KEYUP,
            time=0,
            dwExtraInfo=None,
        )
    )
    user32.SendInput(1, ctypes.byref(input_obj), ctypes.sizeof(INPUT))

# -------------------------- 原有代码（无修改） --------------------------
PW_RENDERFULLCONTENT = 2

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

# -------------------------- 核心修改：修复VK_V错误，替换为0x56 --------------------------
def simulate_paste(text):
    """
    硬件级模拟Ctrl+V粘贴：复制文本到剪贴板 → 真实模拟Ctrl+V按键
    :param text: 要粘贴的文本
    """
    # 1. 将文本复制到系统剪贴板（必须步骤）
    pyperclip.copy(text)
    print(f"已将文本复制到剪贴板，长度: {len(text)}")
    time.sleep(1)  # 复制后等待1秒

    # 2. 硬件级模拟按下Ctrl键
    press_key(win32con.VK_CONTROL)
    print("模拟按下Ctrl键")
    time.sleep(1)  # 按下后等待1秒

    # 3. 硬件级模拟按下V键（修复：用0x56替代win32con.VK_V，V的虚拟键码是0x56）
    press_key(0x56)
    print("模拟按下V键")
    time.sleep(1)  # 按下后等待1秒

    # 4. 硬件级模拟释放V键（修复：用0x56替代win32con.VK_V）
    release_key(0x56)
    print("模拟释放V键")
    time.sleep(1)  # 释放后等待1秒

    # 5. 硬件级模拟释放Ctrl键
    release_key(win32con.VK_CONTROL)
    print("模拟释放Ctrl键")
    time.sleep(1)  # 释放后等待1秒

    # 6. 模拟按下回车发送（如需仅粘贴不发送，注释以下4行）
    press_key(win32con.VK_RETURN)
    print("模拟按下回车")
    time.sleep(1)
    release_key(win32con.VK_RETURN)
    print("模拟释放回车")
    time.sleep(1)

    print("硬件级模拟Ctrl+V粘贴+回车操作完成")

# -------------------------- 主函数（无修改） --------------------------
def main():
    hwnd_parent = get_window_handle_by_class_and_keyword("LDPlayerMainFrame", "墨族")
    if hwnd_parent == 0:
        return

    hwnd_child = get_child_window(hwnd_parent, "RenderWindow")
    if hwnd_child is None:
        print("未找到子窗口: RenderWindow")
        return
    else:
        print(f"找到父窗口句柄: {hwnd_parent}，子窗口句柄: {hwnd_child}")
    time.sleep(1)  # 初始化窗口后等待1秒

    # 强制激活模拟器窗口（确保焦点在模拟器上，关键！）
    win32gui.SetForegroundWindow(hwnd_parent)
    win32gui.ShowWindow(hwnd_parent, win32con.SW_RESTORE)
    time.sleep(1)  # 激活窗口后等待1秒

    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    templates = load_templates(script_dir)
    if not templates:
        return
    if len(templates) < 3:
        print("错误：jpg-5目录下至少需要3张模板图片（1.jpg、2.jpg、3.jpg）")
        return
    time.sleep(1)  # 加载模板后等待1秒

    CLICK_THRESHOLD = 0.85
    MAX_ROUNDS = 100
    MESSAGE_INTERVAL = 300
    # 要粘贴的文本内容
    MESSAGE_TEXT = "/f31/f31/f3120金一张收紫电神功、冥思、符文加身、练气之术、五行真气、快速施法、神秘学、凝神归元技能卷轴，无限收！！！！！/f03有的直邮"

    print("开始执行逻辑：图片1→图片2→粘贴文本→图片3→其他模板...")
    print("按 Q 键可以随时结束脚本。")
    time.sleep(1)  # 打印提示后等待1秒

    rounds = 0
    last_message_time = 0

    while rounds < MAX_ROUNDS:
        if keyboard.is_pressed('q'):
            print("检测到 Q 键，脚本已结束。")
            break

        # 每轮顺序处理所有模板
        for index, (name, template) in enumerate(templates):
            if keyboard.is_pressed('q'):
                print("检测到 Q 键，脚本已结束。")
                return

            img, _ = window_screenshot(hwnd_child)
            pt, _, _, score = find_image(img, template, CLICK_THRESHOLD)
            time.sleep(1)  # 模板匹配后等待1秒
            
            # 处理图片1（index=0）：正常点击
            if index == 0 and pt and score >= CLICK_THRESHOLD:
                abs_x, abs_y = pt
                print(f"找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                time.sleep(1)  # 点击后等待1秒

            # 处理图片2（index=1）：点击后执行粘贴操作
            elif index == 1 and pt and score >= CLICK_THRESHOLD:
                abs_x, abs_y = pt
                print(f"找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                time.sleep(1)  # 点击后等待1秒

                # 粘贴文本的冷却逻辑
                now = time.time()
                if now - last_message_time >= MESSAGE_INTERVAL:
                    simulate_paste(MESSAGE_TEXT)  # 调用硬件级粘贴函数（无需传窗口句柄）
                    last_message_time = now
                else:
                    remaining = MESSAGE_INTERVAL - (now - last_message_time)
                    print(f"粘贴冷却中，还剩 {remaining:.1f} 秒，等待执行...")
                    while remaining > 0:
                        if keyboard.is_pressed('q'):
                            print("检测到 Q 键，脚本已结束。")
                            return
                        time.sleep(0.5)  # 冷却倒计时的0.5秒不修改
                        remaining -= 0.5
                    simulate_paste(MESSAGE_TEXT)  # 调用硬件级粘贴函数
                    last_message_time = now
                time.sleep(1)  # 粘贴逻辑执行后等待1秒

            # 处理图片3（index=2）：粘贴后执行点击
            elif index == 2 and pt and score >= CLICK_THRESHOLD:
                abs_x, abs_y = pt
                print(f"粘贴完成，开始点击图片3: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                time.sleep(1)  # 点击后等待1秒

            # 处理其他模板（index>2）：正常点击
            elif index > 2 and pt and score >= CLICK_THRESHOLD:
                abs_x, abs_y = pt
                print(f"找到目标: {name} 置信度={score:.2f} 坐标: {pt}")
                send_click(hwnd_parent, hwnd_child, abs_x, abs_y)
                time.sleep(1)  # 点击后等待1秒

        # 一轮完成后等待冷却
        print(f"—— 完成第 {rounds+1}/{MAX_ROUNDS} 轮，等待 {MESSAGE_INTERVAL} 秒后开始下一轮 ——")
        waited = 0
        while waited < MESSAGE_INTERVAL:
            if keyboard.is_pressed('q'):
                print("检测到 Q 键，脚本已结束。")
                return
            time.sleep(1)  # 冷却等待1秒
            waited += 1

        rounds += 1
        time.sleep(1)  # 每轮结束后额外等待1秒

    print("脚本结束。")
    time.sleep(1)  # 脚本结束后等待1秒

if __name__ == "__main__":
    main()