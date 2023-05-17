FROM ubuntu:jammy

ENV TZ=America/Los_Angeles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update  &&  apt-get -y install --no-install-recommends  \
    build-essential git openjdk-11-jre-headless python3-dev python3-venv python3-pip  \
    chromium-chromedriver  &&\
    python3 -m pip install --no-cache-dir -U pip  &&\
    python3 -m pip install --no-cache-dir -U setuptools wheel  &&\
    python3 -m pip install --no-cache-dir -U Red-DiscordBot[postgres]  &&\
    apt-get -y clean  &&  rm -rf /var/lib/apt/lists/*


WORKDIR /red
ADD . .
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
