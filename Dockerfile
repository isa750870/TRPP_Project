FROM python:3.10-slim
RUN apt-get update && apt-get install -y \
    libgl1-mesa-dev \
    libglib2.0-0 \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xkb1 \
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libfontconfig1 \
    libdbus-1-3 \
    libx11-6 \
    libx11-xcb1 \
    libxi6 \
    libsm6 \
    libice6 \
    libegl1 \
    libxcb-cursor0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV QT_QPA_PLATFORM_PLUGIN_PATH=/usr/local/lib/python3.10/site-packages/PySide6/Qt/plugins

CMD ["xvfb-run", "-a", "python", "main.py"]