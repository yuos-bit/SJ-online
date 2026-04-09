import sys
import os
import cv2
import numpy as np
from pathlib import Path

# --- 核心配置：禁用 Chromium 的后台休眠限制 ---
os.environ["QTWEBENGINE_CHROMIUM_FLAGS"] = (
    "--enable-gpu "
    "--num-raster-threads=4 "
    "--disable-renderer-backgrounding "            # 关键：防止后台进程优先级降低
    "--disable-background-timer-throttling "       # 关键：防止后台定时器变慢
    "--disable-backgrounding-occluded-windows "     # 关键：防止窗口被遮挡时挂起
)

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, QStackedWidget, 
    QHBoxLayout, QSizePolicy
)
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineProfile, QWebEnginePage
from PyQt6.QtCore import QUrl, QTimer, QPointF, Qt
from PyQt6.QtGui import QMouseEvent, QPixmap, QImage

def get_resource_path(relative_path):
    """ 获取资源绝对路径，兼容开发环境和 PyInstaller 打包后的环境 """
    if hasattr(sys, '_MEIPASS'):
        return os.path.join(sys._MEIPASS, relative_path)
    return os.path.join(os.path.abspath("."), relative_path)

GAME_URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
WINDOW_COUNT = 5

# --- 资源路径 ---
SILENCE_DIR = get_resource_path("image/Silence")
GUAJI_IMG = get_resource_path("image/guaji.png")

class GameWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("世界OL-多窗独立挂机版")
        self.resize(480, 850)

        # 状态数据
        self.speed_states = [False] * WINDOW_COUNT
        self.skip_states = [False] * WINDOW_COUNT
        self.cached_coords = [None] * WINDOW_COUNT 

        # UI 构建
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        
        # 堆栈窗口用于切换
        self.stack = QStackedWidget()
        self.layout.addWidget(self.stack, stretch=8)

        # 窗口切换按钮行
        self.window_button_layout = QHBoxLayout()
        self.layout.addLayout(self.window_button_layout)
        
        # 功能控制按钮行
        self.action_button_layout = QHBoxLayout()
        self.layout.addLayout(self.action_button_layout)

        self.web_views = [None] * WINDOW_COUNT
        self.profiles = [None] * WINDOW_COUNT # 存储独立的 Profile
        self.current_index = 0

        # 初始化窗口切换按钮
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

        # 全局扫描定时器
        self.silence_timer = QTimer()
        self.silence_timer.timeout.connect(self.scan_silence_logic)
        self.is_scanning = False 

        # 默认启动第一个窗口
        self.switch_window(0)

    def switch_window(self, index):
        # 隐藏旧窗口
        if self.web_views[self.current_index]:
            self.web_views[self.current_index].hide()
            
        # 如果目标窗口还没初始化，则创建独立环境
        if not self.web_views[index]:
            # 1. 创建独立的 Profile (隔离 Cookie 和缓存)
            # storage_name 相同会导致数据覆盖，这里每个窗口给一个独立 ID
            profile_id = f"window_profile_{index}"
            profile = QWebEngineProfile(profile_id, self)
            
            # 如果需要保存登录信息，取消下面两行的注释
            # profile.setPersistentCookiesPolicy(QWebEngineProfile.PersistentCookiesPolicy.AllowPersistentCookies)
            # profile.setPersistentStoragePath(get_resource_path(f"storage/{profile_id}"))
            
            self.profiles[index] = profile
            
            # 2. 创建独立 Page
            page = QWebEnginePage(profile, self)
            
            # 3. 创建 View
            web = QWebEngineView()
            web.setPage(page)
            web.setUrl(QUrl(GAME_URL))
            
            self.stack.addWidget(web)
            self.web_views[index] = web
            
        self.current_index = index
        self.stack.setCurrentWidget(self.web_views[index])
        self.web_views[index].show()
        self.update_button_ui()

    def update_button_ui(self):
        idx = self.current_index
        is_skipping = self.skip_states[idx]
        self.auto_skip_btn.setChecked(is_skipping)
        self.auto_skip_btn.setText("自动挂机中" if is_skipping else "自动挂机")
        self.speed_btn.setChecked(self.speed_states[idx])

    def toggle_speed(self):
        idx = self.current_index
        web = self.web_views[idx]
        if not web: return
        
        self.speed_states[idx] = self.speed_btn.isChecked()
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
            console.log("窗口加速已调整为: " + window._sv);
        }})();
        """
        web.page().runJavaScript(js)

    def toggle_auto_skip(self):
        idx = self.current_index
        is_opening = self.auto_skip_btn.isChecked()
        self.skip_states[idx] = is_opening
        
        if is_opening:
            print(f"▶ 窗口 {idx+1} 挂机开启")
            self.locate_and_click_guaji(idx)
            if not self.silence_timer.isActive():
                self.silence_timer.start(100) # 0.1秒扫描一次，兼顾5窗性能
        else:
            print(f"⏹ 窗口 {idx+1} 挂机停止")
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
            print(f"📌 窗口 {idx+1} 坐标锁定: {cx}, {cy}")

    def scan_silence_logic(self):
        if self.is_scanning: return
        self.is_scanning = True
        try:
            # 轮询所有开启了挂机的窗口
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
                        print(f"🎯 窗口 {i+1} Silence命中: {img_p.name}")
                        break 
        finally:
            self.is_scanning = False

    def get_screenshot(self, web_view):
        # 即使窗口在后台隐藏，grab() 依然能抓取到渲染的内容
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
        # 不需要窗口 activate 也可以发送事件，这样后台窗口也能点击
        QApplication.postEvent(target, QMouseEvent(QMouseEvent.Type.MouseButtonPress, p, Qt.MouseButton.LeftButton, Qt.MouseButton.LeftButton, m))
        QTimer.singleShot(40, lambda: QApplication.postEvent(target, QMouseEvent(QMouseEvent.Type.MouseButtonRelease, p, Qt.MouseButton.LeftButton, Qt.MouseButton.LeftButton, m)))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = GameWindow()
    window.show()
    sys.exit(app.exec())