FROM python:3.8-alpine

RUN apk add --update --no-cache \
    alpine-sdk \
    bash \
    build-base \
    linux-headers \
    openjdk11-jre-headless

WORKDIR /red
COPY . /red

#RUN addgroup -g 1000 -S red && \
#    adduser -G red -S -u 1000 red && \
#    chown -R red:red /red && \
#    mkdir /data && chown -R red:red /data
#
#USER red

RUN python -m venv /red/venv && source /red/venv/bin/activate && \
    python -m pip install --no-cache-dir -U pip setuptools wheel && \
    python -m pip install --no-cache-dir -U Red-DiscordBot[postgres]

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
