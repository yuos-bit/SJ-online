# ============================================================
# Dockerfile - LocateAnything-3B
# 基础镜像: nvidia/cuda:12.6.2-runtime-ubuntu22.04 (即 Ubuntu 22.04)
# Python:   3.12.10 (从源码自编译)
# ============================================================
FROM nvidia/cuda:12.6.2-runtime-ubuntu22.04

# ==================== 元信息标签 ====================
LABEL base.image="nvidia/cuda:12.6.2-runtime-ubuntu22.04"
LABEL python.version="3.12.10"
LABEL description="LocateAnything-3B 推理服务"

# ==================== 环境变量 ====================
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV TORCH_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0;9.0a"
ENV CUDA_HOME=/usr/local/cuda
ENV PATH="/usr/local/python3.12/bin:${PATH}"

# ==================== 系统基础依赖 ====================
# 替换为阿里云镜像源加速下载
RUN sed -i 's|http://archive.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    # 编译 Python 3.12.10 所需的构建依赖
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    pkg-config \
    # 运行时系统工具
    curl \
    wget \
    git \
    ca-certificates \
    # OpenCV / 图像处理依赖
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    # 视频处理
    ffmpeg \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    && rm -rf /var/lib/apt/lists/*

# ==================== 编译安装 Python 3.12.10 ====================
RUN cd /tmp && \
    wget -q https://www.python.org/ftp/python/3.12.10/Python-3.12.10.tgz && \
    tar -xzf Python-3.12.10.tgz && \
    cd Python-3.12.10 && \
    ./configure \
        --prefix=/usr/local/python3.12 \
        --enable-optimizations \
        --enable-shared \
        --with-system-ffi \
        --with-computed-gotos \
        --enable-loadable-sqlite-extensions \
        LDFLAGS="-Wl,-rpath,/usr/local/python3.12/lib" && \
    make -j$(nproc) && \
    make install && \
    cd / && rm -rf /tmp/Python-3.12.10 /tmp/Python-3.12.10.tgz

# 设置 Python 软链接
RUN ln -sf /usr/local/python3.12/bin/python3.12 /usr/local/bin/python && \
    ln -sf /usr/local/python3.12/bin/python3.12 /usr/local/bin/python3 && \
    ln -sf /usr/local/python3.12/bin/pip3.12 /usr/local/bin/pip && \
    ln -sf /usr/local/python3.12/bin/pip3.12 /usr/local/bin/pip3

# 注册共享库路径
RUN echo "/usr/local/python3.12/lib" > /etc/ld.so.conf.d/python3.12.conf && ldconfig

# 验证版本
RUN python --version && pip --version

# ==================== 安装 Python 依赖 ====================
# 配置国内镜像源加速下载（必须在 install 之前）
RUN pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

RUN pip install --upgrade pip setuptools wheel

RUN pip install \
    torch==2.5.1 \
    torchvision==0.20.1

RUN pip install \
    transformers==4.57.1 \
    opencv-python-headless==4.11.0.86 \
    numpy==1.26.4 \
    Pillow==11.1.0 \
    peft \
    decord2==1.0.0 \
    lmdb==1.7.5

RUN pip install \
    fastapi \
    uvicorn[standard] \
    python-multipart \
    pydantic

# ==================== 工作目录 ====================
WORKDIR /app

# 复制应用代码
COPY app/ /app/

# 创建运行时挂载目录
RUN mkdir -p /app/model /app/image /app/data

# ==================== 启动 ====================
EXPOSE 8888

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8888"]
