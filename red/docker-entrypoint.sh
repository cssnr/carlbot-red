#!/usr/bin/env bash

set -ex

mkdir -p ~/.config/Red-DiscordBot
cat << EOF > ~/.config/Red-DiscordBot/config.json
{
    "${BOT_NAME}": {
        "DATA_PATH": "/data/${BOT_NAME}",
        "COG_PATH_APPEND": "cogs",
        "CORE_PATH_APPEND": "core",
        "STORAGE_TYPE": "Postgres",
        "STORAGE_DETAILS": {
            "host": "${PGHOST}",
            "port": ${PGPORT},
            "user": "${PGUSER}",
            "password": "${PGPASSWORD}",
            "database": "${PGDATABASE}"
        }
    }
}
EOF

ls -R /data

source /red/venv/bin/activate

redbot "${BOT_NAME}" --edit --no-prompt --token "${BOT_TOKEN}"
redbot "${BOT_NAME}" --edit --no-prompt --prefix "${BOT_PREFIX}"

redbot "${BOT_NAME}"
