# 使用官方 Python 映像檔作為基底映像
FROM python:3.12-slim


# 設定代理伺服器
ENV http_proxy=http://10.160.3.88:8080
ENV https_proxy=http://10.160.3.88:8080


# 安裝必要的系統依賴，像是 portaudio 和 alsa-lib，這些是 pyaudio 的依賴
RUN apt-get update && \
    apt-get install -y \
    python3-dev \
    build-essential \
    portaudio19-dev \
    libsndfile1 \
    libasound2-dev \
    && rm -rf /var/lib/apt/lists/*

# 安裝必要的系統依賴（Whisper 需要 ffmpeg）
RUN apt-get update && apt-get install -y ffmpeg

# 安裝 Python 庫
RUN pip install --upgrade pip
RUN pip install pyaudio speechrecognition transformers

# 使用快取加速 pip 安裝
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    pip install openai-whisper


# 設置工作目錄
WORKDIR /app

# 複製你的應用程式檔案到容器中
COPY . /app

# 設置容器啟動命令
CMD ["python", "app.py"]
