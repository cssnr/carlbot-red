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

ARGS="--no-prompt --mentionable --team-members-are-owners"

if [ -n "${DEBUG}" ];then
    ARGS="${ARGS} --debug --dev"
fi

if [ -n "${BOT_TOKEN}" ];then
    ARGS="${ARGS} --token ${BOT_TOKEN}"
fi

if [ -n "${BOT_PREFIX}" ];then
    for (( i=0; i<${#BOT_PREFIX}; i++ )); do
        ARGS="${ARGS} --prefix ${BOT_PREFIX:$i:1}"
    done
fi

if [ -n "${OWNER}" ];then
    ARGS="${ARGS} --owner ${OWNER}"
fi

if [ -n "${CO_OWNER}" ];then
    ARGS="${ARGS} --co-owner"
    _IFS="$IFS";IFS=","
    for _owner in ${CO_OWNER};do
        ARGS="${ARGS} ${_owner}"
    done
    IFS="$_IFS"
fi

echo "${ARGS}" | xargs redbot "${BOT_NAME}"
