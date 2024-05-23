#!/bin/bash

CONFIG_FILE="/etc/v2ray/config.json"

add_user() {
    UUID=$(uuidgen)
    echo "Adding user with UUID: $UUID"
    jq --arg UUID "$UUID" '.inbounds[0].settings.clients += [{"id": $UUID, "alterId": 64}]' $CONFIG_FILE > tmp.$$.json && mv tmp.$$.json $CONFIG_FILE
    echo "User added. UUID: $UUID"
}

remove_user() {
    UUID=$1
    echo "Removing user with UUID: $UUID"
    jq 'del(.inbounds[0].settings.clients[] | select(.id=="'$UUID'"))' $CONFIG_FILE > tmp.$$.json && mv tmp.$$.json $CONFIG_FILE
    echo "User removed. UUID: $UUID"
}

case "$1" in
    add)
        add_user
        ;;
    remove)
        remove_user $2
        ;;
    *)
        echo "Usage: $0 {add|remove UUID}"
        exit 1
esac

# Restart V2Ray to apply changes
systemctl restart v2ray
