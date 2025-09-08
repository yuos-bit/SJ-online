# 世界Online 微信小程序辅助脚本

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

* 1.安装好[python3.7.7](https://pan.yuos.top/s/46fN?path=%2Fwindows%2F%E8%BD%AF%E4%BB%B6%E5%A4%A7%E5%85%A8%2FPython3)
* 2.将你需要遍历的图标截图放到对应目录下即可（仅限自动挂机&跳图&用药.py），格式为.jpg，图片名字可为英文或英文+数字

![示例](https://free.picui.cn/free/2025/08/22/68a821e62bd23.png)

* 3.黑魔战马、黑魔指环、力量指环 需要到对应怪流程后运行才可正常刷怪，默认为刷100次，如需修改次数，可修改 `MAX_ROUNDS = 100`为`MAX_ROUNDS = 200`即可改为刷200次,世界喊话需要到对应喊话界面运行才可以。

<div style="display: flex; gap: 10px;">

  <img src="https://free.picui.cn/free/2025/08/22/68a824b7289ad.png" width="300px" />
  <img src="https://free.picui.cn/free/2025/08/22/68a824da77d6c.png" width="300px" />

</div>

* 4.脚本执行过程中按`Q`可终止程序

<div style="display: flex; gap: 10px;">

  <img src="https://free.picui.cn/free/2025/08/22/68a8259d1e325.png" width="300px" />
  <img src="https://free.picui.cn/free/2025/08/22/68a825d16a06b.png" width="300px" />
</div>

* 5.开盒子脚本将你要开的盒子图放到 `jpg-6` 里替换即可，然后打开背包运行脚本即可快速开盒子。

* 6.脚本和文件夹对应关系。

| 脚本名称 | 对应目录 |
| --- | --- |
| 自动挂机&跳图&用药.py | jpg |
| 力量指环.py | jpg-2 |
| 黑魔战马.py | jpg-3 |
| 黑魔指环.py | jpg-4 |
| 世界喊话.py | jpg-5 |
| 开盒子.py | jpg-6 |
