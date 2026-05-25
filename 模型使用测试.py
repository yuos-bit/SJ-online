import torch
import torch.nn as nn
from torchvision import models, transforms
import cv2
import win32gui
import win32con
import win32api
import win32ui
import ctypes
import numpy as np
import time
from PIL import Image

# 1. 模型结构 (必须和训练时完全一致)
class ActionLearner(nn.Module):
    def __init__(self):
        super().__init__()
        self.backbone = models.mobilenet_v3_small(weights=None)
        num_features = self.backbone.classifier[0].in_features
        self.backbone.classifier = nn.Identity()
        self.regressor = nn.Sequential(
            nn.Linear(num_features, 128),
            nn.ReLU(),
            nn.Linear(128, 2)
        )
    def forward(self, x):
        x = self.backbone(x)
        return self.regressor(x)

# 2. 辅助工具：获取三层句柄 (你的原始有效逻辑)
def get_child_window(hwnd_parent, target_class, target_title=None):
    result = []
    def callback(child_hwnd, lparam):
        if win32gui.GetClassName(child_hwnd) == target_class:
            if target_title is None or win32gui.GetWindowText(child_hwnd) == target_title:
                result.append(child_hwnd)
    win32gui.EnumChildWindows(hwnd_parent, callback, None)
    return result[0] if result else None

# 3. 截屏逻辑
def window_screenshot(hwnd):
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    width, height = right - left, bottom - top
    hwnd_dc = win32gui.GetWindowDC(hwnd)
    mfc_dc = win32ui.CreateDCFromHandle(hwnd_dc)
    save_dc = mfc_dc.CreateCompatibleDC()
    bitmap = win32ui.CreateBitmap()
    bitmap.CreateCompatibleBitmap(mfc_dc, width, height)
    save_dc.SelectObject(bitmap)
    ctypes.windll.user32.PrintWindow(hwnd, save_dc.GetSafeHdc(), 2)
    bmp_str = bitmap.GetBitmapBits(True)
    img = np.frombuffer(bmp_str, dtype=np.uint8).reshape((height, width, 4))
    win32gui.DeleteObject(bitmap.GetHandle())
    save_dc.DeleteDC()
    mfc_dc.DeleteDC()
    win32gui.ReleaseDC(hwnd, hwnd_dc)
    return img[:, :, :3]

# 4. 加载模型
model = ActionLearner()
model.load_state_dict(torch.load("action_model.pth", map_location=torch.device("cpu")))
model.eval()
preprocess = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
])

# 5. 主循环
hwnd_outer = win32gui.FindWindow("LDPlayerMainFrame", "墨族")
hwnd_mid = get_child_window(hwnd_outer, "RenderWindow", "TheRender")
hwnd_inner = get_child_window(hwnd_mid, "subWin", "sub") if hwnd_mid else None
window_handles = [h for h in [hwnd_outer, hwnd_mid, hwnd_inner] if h]

print("模型+多层句柄点击引擎已启动...")

while True:
    img_bgr = window_screenshot(hwnd_outer)
    img_pil = Image.fromarray(cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB))
    input_tensor = preprocess(img_pil).unsqueeze(0)
    
    with torch.no_grad():
        pred = model(input_tensor)
        screen_x, screen_y = pred[0].tolist()
        
    print(f"预测点击: ({int(screen_x)}, {int(screen_y)})")

    # 关键点：复用你之前验证过有效的多句柄循环点击
    for h_target in window_handles:
        # 这里需要注意，模型预测的是客户区还是屏幕坐标？
        # 如果模型输出是基于全图的，直接转换即可
        cx, cy = win32gui.ScreenToClient(h_target, (win32gui.ClientToScreen(hwnd_outer, (0,0))[0] + int(screen_x), 
                                                    win32gui.ClientToScreen(hwnd_outer, (0,0))[1] + int(screen_y)))
        lParam = win32api.MAKELONG(cx, cy)
        win32api.PostMessage(h_target, win32con.WM_LBUTTONDOWN, win32con.MK_LBUTTON, lParam)
        time.sleep(0.05)
        win32api.PostMessage(h_target, win32con.WM_LBUTTONUP, 0, lParam)
    
    time.sleep(1.0)