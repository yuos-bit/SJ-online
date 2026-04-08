# 世界Online H5 windows桌面版多开版

## 开发环境

* 开发环境： python-3.11.9

## 窗口化运行

```shell
python -m pip install PyQt6 PyQt6-WebEngine opencv-python numpy
```

## 打包成可执行单exe文件

```shell
pip install pyinstaller
pyinstaller --noconfirm --onefile --windowed --add-data "image;image" --name "世界OL助手-墨商定制版" main.py
```