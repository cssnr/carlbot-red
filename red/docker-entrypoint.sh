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
redbot "${BOT_NAME}" --edit --no-prompt --token "${BOT_TOKEN}"
redbot "${BOT_NAME}" --edit --no-prompt --prefix "${BOT_PREFIX}"

if [ -n "${DEBUG}" ];then
    echo "Debug set to: ${DEBUG}"
    redbot --no-prompt --mentionable ---team-members-are-owners --debug --dev "${BOT_NAME}"
else
    redbot --no-prompt --mentionable --team-members-are-owners "${BOT_NAME}"
fi
