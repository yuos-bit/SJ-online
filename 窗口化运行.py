import sys
from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, QStackedWidget,
    QHBoxLayout, QSizePolicy
)
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtCore import QUrl

GAME_URL = "https://sjh5cdn2.good321.net/resgood/index.html?subchannel=merchant1"
WINDOW_COUNT = 5


class GameWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("世界OL多开版")
        self.resize(400, 750)

        # 主布局
        self.layout = QVBoxLayout(self)
        self.layout.setContentsMargins(0, 0, 0, 0)
        self.layout.setSpacing(0)

        # Web区域
        self.stack = QStackedWidget()
        self.stack.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self.layout.addWidget(self.stack, stretch=8)

        # 第一排按钮区域（窗口切换）
        self.window_button_layout = QHBoxLayout()
        self.window_button_layout.setContentsMargins(5, 5, 5, 0)
        self.window_button_layout.setSpacing(5)
        self.layout.addLayout(self.window_button_layout, stretch=0)

        # 第二排按钮区域（加速 + 自动跳过）
        self.action_button_layout = QHBoxLayout()
        self.action_button_layout.setContentsMargins(5, 5, 5, 5)
        self.action_button_layout.setSpacing(5)
        self.layout.addLayout(self.action_button_layout, stretch=0)

        self.web_views = [None] * WINDOW_COUNT
        self.current_index = 0

        # ===== 第一排窗口按钮 =====
        for i in range(WINDOW_COUNT):
            btn = QPushButton(f"窗口 {i+1}")
            btn.setMinimumHeight(60)
            btn.clicked.connect(lambda checked, idx=i: self.switch_window(idx))
            self.window_button_layout.addWidget(btn)

        # ===== 第二排操作按钮 =====
        # 加速按钮
        self.speed_btn = QPushButton("🚀 5倍加速")
        self.speed_btn.setMinimumHeight(40)
        self.speed_btn.setCheckable(True)
        self.speed_btn.clicked.connect(self.toggle_speed)
        self.action_button_layout.addWidget(self.speed_btn)

        # 自动跳过按钮
        self.auto_skip_btn = QPushButton("🤖 自动跳过")
        self.auto_skip_btn.setMinimumHeight(40)
        self.auto_skip_btn.setCheckable(True)
        self.auto_skip_btn.clicked.connect(self.toggle_auto_skip)
        self.action_button_layout.addWidget(self.auto_skip_btn)

        # 初始化第一个窗口
        self.switch_window(0)

    # ========================
    # 窗口切换（懒加载 + 状态保留）
    # ========================
    def switch_window(self, index):
        if self.web_views[self.current_index]:
            self.web_views[self.current_index].hide()

        if not self.web_views[index]:
            web = QWebEngineView()
            web.setUrl(QUrl(GAME_URL))
            web.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
            self.stack.addWidget(web)
            self.web_views[index] = web

        self.web_views[index].show()
        self.stack.setCurrentWidget(self.web_views[index])
        self.current_index = index

    # ========================
    # 🚀 5倍加速（可恢复）
    # ========================
    def toggle_speed(self):
        web = self.web_views[self.current_index]
        if not web:
            return

        if self.speed_btn.isChecked():
            js_code = """
            (function() {
                if (window._speedHackActive) return;
                window._speedHackActive = true;

                const SPEED = 5;

                window._originalSetTimeout = window.setTimeout;
                window._originalSetInterval = window.setInterval;
                window._originalRAF = window.requestAnimationFrame;
                window._originalDateNow = Date.now;

                window.setTimeout = function(fn, t){
                    return window._originalSetTimeout(fn, t / SPEED);
                };

                window.setInterval = function(fn, t){
                    return window._originalSetInterval(fn, t / SPEED);
                };

                window.requestAnimationFrame = function(cb){
                    return window._originalRAF(function(time){
                        cb(time * SPEED);
                    });
                };

                const start = window._originalDateNow();
                Date.now = function(){
                    return start + (window._originalDateNow() - start) * SPEED;
                };

                console.log("🚀 5倍加速开启");
            })();
            """
        else:
            js_code = """
            (function() {
                if (!window._speedHackActive) return;

                window.setTimeout = window._originalSetTimeout;
                window.setInterval = window._originalSetInterval;
                window.requestAnimationFrame = window._originalRAF;
                Date.now = window._originalDateNow;

                window._speedHackActive = false;

                console.log("✅ 已恢复正常速度");
            })();
            """
        web.page().runJavaScript(js_code)

    # ========================
    # 🤖 自动点击“跳过”
    # ========================
    def toggle_auto_skip(self):
        web = self.web_views[self.current_index]
        if not web:
            return

        if self.auto_skip_btn.isChecked():
            js_code = """
            (function() {
                if (window._autoSkip) return;

                window._autoSkip = setInterval(function(){

                    let nodes = Array.from(document.querySelectorAll("*"));

                    for (let n of nodes) {
                        if (!n.innerText) continue;

                        if (n.innerText.includes("跳过")) {
                            let rect = n.getBoundingClientRect();

                            let x = rect.left + rect.width / 2;
                            let y = rect.top - 10;

                            let el = document.elementFromPoint(x, y);
                            if (!el) continue;

                            let evt = new MouseEvent('click', {
                                bubbles: true,
                                cancelable: true,
                                clientX: x,
                                clientY: y
                            });

                            el.dispatchEvent(evt);

                            console.log("🎯 点击跳过(偏移3px)");
                            break;
                        }
                    }

                }, 300);
            })();
            """
        else:
            js_code = """
            (function() {
                if (window._autoSkip) {
                    clearInterval(window._autoSkip);
                    window._autoSkip = null;
                    console.log("⛔ 自动跳过停止");
                }
            })();
            """
        web.page().runJavaScript(js_code)


# ========================
# 入口
# ========================
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = GameWindow()
    window.show()
    sys.exit(app.exec())