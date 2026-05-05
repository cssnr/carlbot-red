FROM ubuntu:jammy

LABEL org.opencontainers.image.source="https://github.com/cssnr/carlbot-red"
LABEL org.opencontainers.image.description="Carl Red Docker"
LABEL org.opencontainers.image.authors="smashedr"

ENV TZ=America/Los_Angeles
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    build-essential \
    git \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo-gobject2 \
    libcairo2 \
    libdbus-glib-1-2 \
    libdrm2 \
    libgbm1 \
    libgdk-pixbuf-2.0-0 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    libxtst6 \
    libzbar0 \
    openjdk-11-jre-headless \
    python3-dev \
    python3-pip \
    python3-venv \
    && python3 -m pip install --no-cache-dir -U pip &&\
    python3 -m pip install --no-cache-dir -U setuptools wheel &&\
    python3 -m pip install --no-cache-dir -U Red-DiscordBot[postgres] &&\
    apt-get -y clean && rm -rf /var/lib/apt/lists/*

WORKDIR /red
COPY . .
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
