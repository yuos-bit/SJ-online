import sys
import os
import cv2
import numpy as np
from pathlib import Path

# --- Win7 兼容性与性能优化 ---
# 1. --ignore-certificate-errors: 核心修改，解决 Win7 证书过期导致的“网页无法连接”
# 2. --ignore-gpu-blacklist: 解决旧显卡驱动导致的黑屏
os.environ["QTWEBENGINE_CHROMIUM_FLAGS"] = (
    "--enable-gpu "
    "--num-raster-threads=4 "
    "--ignore-gpu-blacklist "
    "--ignore-certificate-errors "
    "--allow-insecure-localhost"
)

# 适配 PyQt5 库
from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, QStackedWidget, 
    QHBoxLayout, QSizePolicy
)
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl, QTimer, QPointF, Qt
from PyQt5.QtGui import QMouseEvent, QPixmap, QImage

def get_resource_path(relative_path):
    """ 获取资源绝对路径，兼容开发环境和 PyInstaller 打包后的环境 """
    if hasattr(sys, '_MEIPASS'):
        return os.path.join(sys._MEIPASS, relative_path)
    return os.path.join(os.path.abspath("."), relative_path)

GAME_URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
WINDOW_COUNT = 5

# 资源路径
SILENCE_DIR = get_resource_path("image/Silence")
GUAJI_IMG = get_resource_path("image/guaji.png")

class GameWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("世界OL-墨商专供版-win7")
        self.resize(480, 850)

        # 状态数据
        self.speed_states = [False] * WINDOW_COUNT
        self.skip_states = [False] * WINDOW_COUNT
        self.cached_coords = [None] * WINDOW_COUNT

        # UI 构建
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.stack = QStackedWidget()
        self.layout.addWidget(self.stack)

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

    def update_button_ui(self):
        idx = self.current_index
        is_skipping = self.skip_states[idx]
        self.auto_skip_btn.setChecked(is_skipping)
        self.auto_skip_btn.setText("自动挂机中" if is_skipping else "自动挂机")
        self.speed_btn.setChecked(self.speed_states[idx])

    def switch_window(self, index):
        if self.web_views[self.current_index]:
            self.web_views[self.current_index].hide()
        
        if not self.web_views[index]:
            web = QWebEngineView()
            # 也可以在这里二次确保忽略证书错误（可选）
            web.page().certificateError = lambda error: True
            web.setUrl(QUrl(GAME_URL))
            self.stack.addWidget(web)
            self.web_views[index] = web
            
        self.current_index = index
        self.stack.setCurrentWidget(self.web_views[index])
        self.web_views[index].show()
        self.update_button_ui()

    def toggle_speed(self):
        web = self.web_views[self.current_index]
        if not web: return
        self.speed_states[self.current_index] = self.speed_btn.isChecked()
        target = 5.0 if self.speed_btn.isChecked() else 1.0
        js = f"""
        (function() {{
            if (!window._sh) {{
                window._sh = true; window._sv = 1.0;
                const _st = window.setTimeout, _si = window.setInterval, _now = Date.now;
                let lastR = _now(), virt = _now();
                Date.now = () => {{ const curR = _now(); virt += (curR - lastR) * window._sv; lastR = curR; return virt; }};
                window.setTimeout = (f, t) => _st(f, t / window._sv);
                window.setInterval = (f, t) => _si(f, t / window._sv);
            }}
            window._sv = {target};
        }})();
        """
        web.page().runJavaScript(js)

    def toggle_auto_skip(self):
        idx = self.current_index
        is_opening = self.auto_skip_btn.isChecked()
        self.skip_states[idx] = is_opening
        
        if is_opening:
            self.locate_and_click_guaji(idx)
            if not self.silence_timer.isActive():
                self.silence_timer.start(100)
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
                        break 
        finally:
            self.is_scanning = False

    def get_screenshot(self, web_view):
        pixmap = web_view.grab()
        if pixmap.isNull(): return None
        img = pixmap.toImage().convertToFormat(QImage.Format_RGBA8888)
        width = img.width()
        height = img.height()
        ptr = img.bits()
        ptr.setsize(height * width * 4)
        arr = np.frombuffer(ptr, np.uint8).reshape((height, width, 4))
        return cv2.cvtColor(arr, cv2.COLOR_RGBA2BGR)

    def click_at(self, web, x, y):
        target = web.focusProxy() or web
        p = QPointF(float(x), float(y))
        m = Qt.NoModifier
        ev_press = QMouseEvent(QMouseEvent.MouseButtonPress, p, Qt.LeftButton, Qt.LeftButton, m)
        QApplication.postEvent(target, ev_press)
        
        def release():
            ev_release = QMouseEvent(QMouseEvent.MouseButtonRelease, p, Qt.LeftButton, Qt.LeftButton, m)
            QApplication.postEvent(target, ev_release)
        
        QTimer.singleShot(50, release)

if __name__ == "__main__":
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)
    window = GameWindow()
    window.show()
    sys.exit(app.exec_())