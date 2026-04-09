import sys
import os
import cv2
import numpy as np
import ctypes
from pathlib import Path

# --- 核心配置：彻底禁用 Chromium 的所有后台节能限制 ---
os.environ["QTWEBENGINE_CHROMIUM_FLAGS"] = (
    "--enable-gpu "
    "--num-raster-threads=4 "
    "--disable-renderer-backgrounding "
    "--disable-background-timer-throttling "
    "--disable-backgrounding-occluded-windows "
    "--disable-features=CalculateNativeWinOcclusion "
)

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, 
    QHBoxLayout, QSizePolicy
)
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineProfile, QWebEnginePage
from PyQt6.QtCore import QUrl, QTimer, QPointF, Qt
from PyQt6.QtGui import QMouseEvent, QImage, QIcon

def get_resource_path(relative_path):
    if hasattr(sys, '_MEIPASS'):
        return os.path.join(sys._MEIPASS, relative_path)
    return os.path.join(os.path.abspath("."), relative_path)

GAME_URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
WINDOW_COUNT = 5
SILENCE_DIR = get_resource_path("image/Silence")
GUAJI_IMG = get_resource_path("image/guaji.png")

class GameWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("世界OL-墨商加速版")
        self.resize(480, 850)
        
        # --- 窗口左上角图标使用 favicon.ico ---
        icon_path = get_resource_path("ico/favicon.ico")
        if os.path.exists(icon_path):
            self.setWindowIcon(QIcon(icon_path))

        self.speed_states = [False] * WINDOW_COUNT
        self.skip_states = [False] * WINDOW_COUNT
        self.cached_coords = [None] * WINDOW_COUNT 

        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        
        self.container = QWidget()
        self.container.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self.layout.addWidget(self.container, stretch=8)

        self.window_button_layout = QHBoxLayout()
        self.layout.addLayout(self.window_button_layout)
        
        self.action_button_layout = QHBoxLayout()
        self.layout.addLayout(self.action_button_layout)

        self.web_views = [None] * WINDOW_COUNT
        self.current_index = 0

        for i in range(WINDOW_COUNT):
            btn = QPushButton(f"窗口 {i+1}")
            btn.setMinimumHeight(50)
            btn.clicked.connect(lambda checked, idx=i: self.switch_window(idx))
            self.window_button_layout.addWidget(btn)

        self.speed_btn = QPushButton("开启加速")
        self.speed_btn.setFixedHeight(40)
        self.speed_btn.setCheckable(True)
        self.speed_btn.clicked.connect(self.toggle_speed)
        self.action_button_layout.addWidget(self.speed_btn)

        self.auto_skip_btn = QPushButton("自动挂机")
        self.auto_skip_btn.setFixedHeight(40)
        self.auto_skip_btn.setCheckable(True)
        self.auto_skip_btn.clicked.connect(self.toggle_auto_skip)
        self.action_button_layout.addWidget(self.auto_skip_btn)

        self.silence_timer = QTimer()
        self.silence_timer.timeout.connect(self.scan_silence_logic)
        self.is_scanning = False 

        self.switch_window(0)

    def switch_window(self, index):
        if not self.web_views[index]:
            # 为了避免 Release of profile 警告，显式指定父对象
            profile = QWebEngineProfile(f"profile_{index}", self)
            page = QWebEnginePage(profile, self)
            
            web = QWebEngineView(self.container)
            web.setPage(page)
            web.setUrl(QUrl(GAME_URL))
            web.resize(self.container.size())
            self.web_views[index] = web
            
        self.current_index = index
        target_web = self.web_views[index]
        target_web.show() 
        target_web.raise_()
        self.update_button_ui()

    # ... (其他函数保持原样即可) ...

    def closeEvent(self, event):
        """退出时显式清理，避免 WebEngine 报错"""
        for web in self.web_views:
            if web:
                web.setPage(None)
        super().closeEvent(event)

    def resizeEvent(self, event):
        super().resizeEvent(event)
        container_size = self.container.size()
        for web in self.web_views:
            if web:
                web.resize(container_size)

    def update_button_ui(self):
        idx = self.current_index
        self.auto_skip_btn.setChecked(self.skip_states[idx])
        self.auto_skip_btn.setText("自动挂机中" if self.skip_states[idx] else "自动挂机")
        self.speed_btn.setChecked(self.speed_states[idx])

    def toggle_speed(self):
        idx = self.current_index
        web = self.web_views[idx]
        if not web: return
        self.speed_states[idx] = self.speed_btn.isChecked()
        target = 5.0 if self.speed_btn.isChecked() else 1.0
        js = f"if(window._sh){{ window._sv={target}; }}else{{ (function(){{ window._sh=true; window._sv={target}; const _st=window.setTimeout,_si=window.setInterval,_now=Date.now; let lastR=_now(),virt=_now(); Date.now=()=>{{ const curR=_now(); virt+=(curR-lastR)*window._sv; lastR=curR; return virt; }}; window.setTimeout=(f,t)=>_st(f,t/window._sv); window.setInterval=(f,t)=>_si(f,t/window._sv); }})(); }}"
        web.page().runJavaScript(js)

    def toggle_auto_skip(self):
        idx = self.current_index
        self.skip_states[idx] = self.auto_skip_btn.isChecked()
        if self.skip_states[idx]:
            self.locate_and_click_guaji(idx)
            if not self.silence_timer.isActive():
                self.silence_timer.start(150)
        else:
            if self.cached_coords[idx]:
                self.click_at(self.web_views[idx], self.cached_coords[idx].x(), self.cached_coords[idx].y())
            if not any(self.skip_states):
                self.silence_timer.stop()
        self.update_button_ui()

    def locate_and_click_guaji(self, idx):
        web = self.web_views[idx]
        screen = self.get_screenshot(web)
        if screen is None: return
        temp = cv2.imread(GUAJI_IMG)
        if temp is None: return
        res = cv2.matchTemplate(screen, temp, cv2.TM_CCOEFF_NORMED)
        _, max_v, _, max_l = cv2.minMaxLoc(res)
        if max_v >= 0.8:
            h, w = temp.shape[:2]
            cx, cy = max_l[0] + w/2, max_l[1] + h/2
            self.cached_coords[idx] = QPointF(float(cx), float(cy))
            self.click_at(web, cx, cy)

    def scan_silence_logic(self):
        if self.is_scanning: return
        self.is_scanning = True
        try:
            for i in range(WINDOW_COUNT):
                if not self.skip_states[i] or not self.web_views[i]: continue
                screen = self.get_screenshot(self.web_views[i])
                if screen is None: continue
                path = Path(SILENCE_DIR)
                if not path.exists(): continue
                for img_p in sorted(path.glob("*")):
                    if img_p.suffix.lower() not in ['.png', '.jpg']: continue
                    temp = cv2.imread(str(img_p))
                    if temp is None: continue
                    res = cv2.matchTemplate(screen, temp, cv2.TM_CCOEFF_NORMED)
                    _, max_v, _, max_l = cv2.minMaxLoc(res)
                    if max_v >= 0.8:
                        h, w = temp.shape[:2]
                        self.click_at(self.web_views[i], max_l[0] + w/2, max_l[1] + h/2)
                        print(f"🎯 窗口 {i+1} 命中: {img_p.name}")
                        break 
        finally:
            self.is_scanning = False

    def get_screenshot(self, web_view):
        pixmap = web_view.grab()
        if pixmap.isNull(): return None
        img = pixmap.toImage().convertToFormat(QImage.Format.Format_RGBA8888)
        ptr = img.bits(); ptr.setsize(img.sizeInBytes())
        arr = np.frombuffer(ptr, np.uint8).reshape((img.height(), img.width(), 4))
        return cv2.cvtColor(arr, cv2.COLOR_RGBA2BGR)

    def click_at(self, web, x, y):
        target = web.focusProxy()
        p = QPointF(float(x), float(y))
        m = Qt.KeyboardModifier.NoModifier
        QApplication.postEvent(target, QMouseEvent(QMouseEvent.Type.MouseButtonPress, p, Qt.MouseButton.LeftButton, Qt.MouseButton.LeftButton, m))
        QTimer.singleShot(40, lambda: QApplication.postEvent(target, QMouseEvent(QMouseEvent.Type.MouseButtonRelease, p, Qt.MouseButton.LeftButton, Qt.MouseButton.LeftButton, m)))

if __name__ == "__main__":
    try:
        # 给 Windows 注册 AppID，保证任务栏图标独立显示
        my_app_id = 'myorg.world_ol.multi_view.v1' 
        ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(my_app_id)
    except Exception:
        pass

    app = QApplication(sys.argv)
    
    # --- 任务栏图标使用 icon.ico ---
    taskbar_icon = get_resource_path("ico/icon.ico")
    if os.path.exists(taskbar_icon):
        app.setWindowIcon(QIcon(taskbar_icon))
    
    window = GameWindow()
    window.show()
    sys.exit(app.exec())