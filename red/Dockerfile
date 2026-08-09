FROM ubuntu:noble

LABEL org.opencontainers.image.source="https://github.com/cssnr/carlbot-red"
LABEL org.opencontainers.image.description="Carl Red Docker"
LABEL org.opencontainers.image.authors="smashedr"

ENV TZ=America/Los_Angeles
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/venv/bin:${PATH}"

RUN apt-get update && apt-get -y install --no-install-recommends \
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
    openjdk-17-jre-headless \
    software-properties-common \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
        python3.11 \
        python3.11-dev \
        python3.11-venv \
    && python3.11 -m venv /venv \
    && /venv/bin/pip install --no-cache-dir -U pip setuptools wheel \
    && /venv/bin/pip install --no-cache-dir -U "Red-DiscordBot[postgres]" \
    && /venv/bin/pip install --no-cache-dir -U typing_extensions \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /red
COPY . .
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
