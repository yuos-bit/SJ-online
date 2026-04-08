import sys
import os
import cv2
import numpy as np

# 重新启用 GPU 加速，确保加速脚本有效
if "QTWEBENGINE_CHROMIUM_FLAGS" in os.environ:
    del os.environ["QTWEBENGINE_CHROMIUM_FLAGS"]

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, QStackedWidget,
    QHBoxLayout, QSizePolicy
)
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtCore import QUrl, QTimer, QPointF, Qt
from PyQt6.QtGui import QMouseEvent, QPixmap

GAME_URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
WINDOW_COUNT = 5
TEMPLATE_PATH = "./image/guaji.png" 

class GameWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("世界OL多开版 - GPU加速修复版")
        self.resize(480, 850)

        self.speed_states = [False] * WINDOW_COUNT
        self.skip_states = [False] * WINDOW_COUNT
        
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.stack = QStackedWidget()
        self.layout.addWidget(self.stack, stretch=8)

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

        self.speed_btn = QPushButton("加速开启")
        self.speed_btn.setCheckable(True)
        self.speed_btn.clicked.connect(self.toggle_speed)
        self.action_button_layout.addWidget(self.speed_btn)

        self.auto_skip_btn = QPushButton("自动挂机")
        self.auto_skip_btn.setCheckable(True)
        self.auto_skip_btn.clicked.connect(self.toggle_auto_skip)
        self.action_button_layout.addWidget(self.auto_skip_btn)

        self.scan_timer = QTimer()
        self.scan_timer.timeout.connect(self.scan_for_button)
        self.scan_timer.start(2000) 

        self.switch_window(0)

    def update_button_ui(self):
        is_speeding = self.speed_states[self.current_index]
        self.speed_btn.setChecked(is_speeding)
        self.speed_btn.setText("已开启5倍加速" if is_speeding else "加速开启")
        
        is_skipping = self.skip_states[self.current_index]
        self.auto_skip_btn.setChecked(is_skipping)
        self.auto_skip_btn.setText("自动挂机中" if is_skipping else "自动挂机")

    def switch_window(self, index):
        if self.web_views[self.current_index]:
            self.web_views[self.current_index].hide()
        if not self.web_views[index]:
            web = QWebEngineView()
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
        is_active = self.speed_btn.isChecked()
        self.speed_states[self.current_index] = is_active
        
        if is_active:
            # 使用更强力的定时器加速逻辑
            js = """
            (function(){
                if(window._speedActive) return;
                window._speedActive = true;
                const ratio = 5;
                const _st = window.setTimeout;
                const _si = window.setInterval;
                window.setTimeout = (f, d) => _st(f, d/ratio);
                window.setInterval = (f, d) => _si(f, d/ratio);
                // 针对某些 H5 游戏的 rAF 加速
                const _rAF = window.requestAnimationFrame;
                let lastTime = 0;
                window.requestAnimationFrame = (cb) => {
                    return _rAF((time) => cb(time * ratio));
                };
                console.log("🚀 5倍加速已在当前窗口注入");
            })();
            """
        else:
            js = "location.reload();"
        web.page().runJavaScript(js)
        self.update_button_ui()

    def toggle_auto_skip(self):
        self.skip_states[self.current_index] = self.auto_skip_btn.isChecked()
        self.update_button_ui()

    def scan_for_button(self):
        for i in range(WINDOW_COUNT):
            if self.skip_states[i] and self.web_views[i]:
                self.perform_image_recognition(i, self.web_views[i])

    def perform_image_recognition(self, idx, web_view):
        try:
            # 改进的截图方式：使用 grab() 但通过 render 保证兼容性
            pixmap = QPixmap(web_view.size())
            web_view.render(pixmap)
            image = pixmap.toImage().convertToFormat(image.Format.Format_RGBA8888)
            
            width, height = image.width(), image.height()
            ptr = image.bits()
            ptr.setsize(image.sizeInBytes())
            arr = np.frombuffer(ptr, np.uint8).reshape((height, width, 4))
            screen_img = cv2.cvtColor(arr, cv2.COLOR_RGBA2BGR)

            template = cv2.imread(TEMPLATE_PATH)
            if template is None: return

            res = cv2.matchTemplate(screen_img, template, cv2.TM_CCOEFF_NORMED)
            _, max_val, _, max_loc = cv2.minMaxLoc(res)

            if max_val >= 0.8:
                h, w = template.shape[:2]
                center_x = float(max_loc[0] + w / 2)
                center_y = float(max_loc[1] + h / 2)
                
                print(f"[窗口 {idx+1}] 匹配成功({max_val:.2f}) -> 执行单次点击并关闭挂机")
                
                # 执行点击
                self.click_at(web_view, center_x, center_y)
                
                # 状态修改：点击成功后立即关闭挂机
                self.skip_states[idx] = False
                # 如果当前正在看这个窗口，刷新UI按钮状态
                if idx == self.current_index:
                    self.auto_skip_btn.setChecked(False)
                    self.update_button_ui()
                
        except Exception as e:
            print(f"识别异常: {e}")

    def click_at(self, web_view, x, y):
        target = web_view.focusProxy()
        # 关键修复：PyQt6 必须使用 QPointF
        point = QPointF(x, y)
        
        no_mod = Qt.KeyboardModifier.NoModifier
        
        # 模拟按下
        press_event = QMouseEvent(
            QMouseEvent.Type.MouseButtonPress, 
            point, 
            Qt.MouseButton.LeftButton, 
            Qt.MouseButton.LeftButton, 
            no_mod
        )
        # 模拟抬起
        release_event = QMouseEvent(
            QMouseEvent.Type.MouseButtonRelease, 
            point, 
            Qt.MouseButton.LeftButton, 
            Qt.MouseButton.LeftButton, 
            no_mod
        )
        
        QApplication.postEvent(target, press_event)
        QTimer.singleShot(100, lambda: QApplication.postEvent(target, release_event))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = GameWindow()
    window.show()
    sys.exit(app.exec())