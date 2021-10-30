FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install \
    build-essential \
    git \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir -U pip setuptools wheel && \
    python -m pip install --no-cache-dir -U Red-DiscordBot[postgres]

WORKDIR /red
ADD . .

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
