FROM ubuntu:jammy

ENV TZ=America/Los_Angeles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update  &&  apt-get -y install --no-install-recommends  \
    build-essential git openjdk-11-jre-headless python3-dev python3-venv python3-pip libzbar0  \
    libatk1.0-0 libatk-bridge2.0-0 libdrm2 libxcb1 libxkbcommon0 libatspi2.0-0 libx11-6  \
    libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libgbm1 libpango-1.0-0 libcairo2  \
    libgtk-3-0 libxtst6 libpangocairo-1.0-0 libcairo-gobject2 libgdk-pixbuf-2.0-0 libdbus-glib-1-2 libx11-xcb1 libxcursor1  &&\
    python3 -m pip install --no-cache-dir -U pip  &&\
    python3 -m pip install --no-cache-dir -U setuptools wheel  &&\
    python3 -m pip install --no-cache-dir -U Red-DiscordBot[postgres]  &&\
    apt-get -y clean  &&  rm -rf /var/lib/apt/lists/*


WORKDIR /red
ADD . .
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
