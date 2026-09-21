import cv2, numpy as np, time, os, win32gui, win32ui, win32con, win32api, sys, ctypes, keyboard

user32 = ctypes.windll.user32

def child(h, c, t=None):
    r = []
    def cb(x, _):
        if win32gui.GetClassName(x) == c:
            if t is None or win32gui.GetWindowText(x) == t: r.append(x)
    win32gui.EnumChildWindows(h, cb, None)
    return r[0] if r else None

def shot(hwnd):
    l, t, r, b = win32gui.GetWindowRect(hwnd); w, hgt = r - l, b - t
    hw = win32gui.GetWindowDC(hwnd); hm = win32ui.CreateDCFromHandle(hw); cd = hm.CreateCompatibleDC()
    bm = win32ui.CreateBitmap(); bm.CreateCompatibleBitmap(hm, w, hgt); cd.SelectObject(bm)
    user32.PrintWindow(hwnd, cd.GetSafeHdc(), 2)
    bi = bm.GetInfo(); bs = bm.GetBitmapBits(True)
    img = np.frombuffer(bs, dtype=np.uint8).reshape((bi['bmHeight'], bi['bmWidth'], 4))
    win32gui.DeleteObject(bm.GetHandle()); cd.DeleteDC(); hm.DeleteDC(); win32gui.ReleaseDC(hwnd, hw)
    return cv2.cvtColor(img, cv2.COLOR_BGRA2GRAY), (l, t)

def load(d, folder):
    p = os.path.join(d, folder)
    if not os.path.exists(p): return []
    fs = sorted([x for x in os.listdir(p) if x.lower().endswith('.jpg')],
                key=lambda x: int(os.path.splitext(x)[0]) if os.path.splitext(x)[0].isdigit() else x)
    tmps = []
    for f in fs:
        img = cv2.imread(os.path.join(p, f), cv2.IMREAD_GRAYSCALE)
        if img is not None: tmps.append((f, img))
    return tmps

def match(tgt, tpl, th=0.85):
    h, w = tpl.shape[:2]
    if h > tgt.shape[0] or w > tgt.shape[1]: return None
    res = cv2.matchTemplate(tgt, tpl, cv2.TM_CCOEFF_NORMED)
    _, mv, _, ml = cv2.minMaxLoc(res)
    return (ml[0] + w // 2, ml[1] + h // 2) if mv >= th else None

def click(hwnd, x, y):
    lp = win32api.MAKELONG(x, y)
    win32api.PostMessage(hwnd, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lp)
    win32api.PostMessage(hwnd, win32con.WM_LBUTTONUP, 0, lp)

def main():
    TITLE = "墨族"; JPG = "jpg8"; KEY = 'f8'; TH = 0.85
    ho = win32gui.FindWindow("LDPlayerMainFrame", TITLE)
    if not ho: print(f"未找到窗口: {TITLE}"); return
    hm = child(ho, "RenderWindow", "TheRender")
    hi = child(hm, "subWin", "sub") if hm else None
    handles = [h for h in [ho, hm, hi] if h]
    sd = os.path.abspath(os.path.dirname(sys.argv[0]))
    tmps = load(sd, JPG)
    if not tmps: print("未加载到模板"); return
    sh = hi or ho; ox, oy, _, _ = win32gui.GetWindowRect(sh)
    n = len(tmps)
    ROUNDS = 999
    print(f"启动: {n}张图 | {ROUNDS}轮 | {KEY.upper()}退出")
    for round_num in range(1, ROUNDS + 1):
        if keyboard.is_pressed(KEY):
            print("用户退出")
            return
        print(f"--- 第{round_num}/{ROUNDS}轮 ---")
        found_any = False
        for i, (name, tpl) in enumerate(tmps):
            if keyboard.is_pressed(KEY):
                print("用户退出")
                return
            print(f"[{round_num}-{i+1}/{n}] 查找 {name} ...", end=' ')
            found = False
            for attempt in range(2):  # 最多尝试2次（首次 + 重试1次）
                if keyboard.is_pressed(KEY):
                    print("用户退出")
                    return
                g, _ = shot(sh); pt = match(g, tpl, TH)
                if pt:
                    sx, sy = ox + pt[0], oy + pt[1]
                    for h in handles:
                        cx, cy = win32gui.ScreenToClient(h, (sx, sy)); click(h, cx, cy)
                    print(f"✓")
                    found = True
                    found_any = True
                    break
                if attempt == 0:
                    time.sleep(0.01)  # 首次未找到，等10ms后重试
            if not found:
                print(f"✗ 跳过")
            time.sleep(0.3)  # 每张图查找间隔600ms
        if not found_any:
            print(f"第{round_num}轮未找到任何图片，进入下一轮")
    print("全部完成")

if __name__ == "__main__": main()
