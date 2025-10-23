# 世界Online 微信小程序辅助脚本

## 效果展示

![脚本多开示例](./demo/demo.gif)

## 开发环境

* 原始开发环境 ~~Python 3.7.7~~
* 新版开发环境： python-3.11.9

## 实现原理

* 基于窗口句柄和图像、文字识别技术

## 需要安装的库

```shell
pip install opencv-contrib-python numpy keyboard pywin32 opencv-python pyautogui dxcam easyocr
```

更新库

```shell
pip install --upgrade pywin32
```

## 使用方法

* 1.安装好[python3](https://pan.yuos.top/s/46fN?path=%2Fwindows%2F%E8%BD%AF%E4%BB%B6%E5%A4%A7%E5%85%A8%2FPython3)
* 2.安装好[谷歌浏览器](https://www.chromedownloads.net/chrome64win/)
* 3.拉取脚本仓库：

  ```shell
  git clone -b chrome https://github.com/yuos-bit/SJ-online
  ```

* 4.将你需要遍历的图标截图放到对应目录下(例如：jpg-1)即可，格式为.jpg，图片名字可为英文或英文+数字，但不可包含空格或者中文。
* 打开游戏地址：<https://sjh5cdn2.good321.net/resgood/index.html?subchannel=live_douyin2>

### 基础玩法

* 1.修改脚本中游戏名字，具体见下图![image.png](https://free.picui.cn/free/2025/10/23/68f99a9194117.png)需要开几个号就复制几个`跳图.py`，修改图中位置就行。
* 然后打开cmd（右键管理员运行）
![image.png](https://free.picui.cn/free/2025/10/23/68f99c0aa4ac2.png)
进入对应目录后运行`python 跳图-2.py` 即可愉快游戏了。
![image.png](https://free.picui.cn/free/2025/10/23/68f99d2156b23.png)

**注意：图片可能无法通用，所以，如果你的模板加载成功后无任何动静，请重新自行截图替换本项目中的图片然后重新运行脚本即可.**

### 进阶玩法

#### 1.刷游戏装备

