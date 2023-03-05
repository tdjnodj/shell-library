#!/bin/bash

# Comes from ChatGPT

getUUID() {
    echo ""
    uuid_regex='^[[:xdigit:]]{8}-[[:xdigit:]]{4}-[[:xdigit:]]{4}-[[:xdigit:]]{4}-[[:xdigit:]]{12}$'
    read -p "请输入你的 uuid: " answer
    if [ -z "$answer" ]; then
        uuid=$(uuidgen)
    elif [ "$answer" == "${uuid_regex}" ]; then
        uuid="${answer}"
    else
        red "uuid 不合法！"
        exit 1
    fi
}