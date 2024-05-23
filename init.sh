#!/bin/bash

# Ensure UUID is set
if [ -z "$UUID" ]; then
    echo "UUID is not set. Exiting."
    exit 1
fi

# Initialize V2Ray configuration
if [ ! -f /etc/v2ray/config.json ]; then
    cp /config.json /etc/v2ray/config.json
fi

# Replace placeholders in config.json with environment variables
sed -i "s/UUID_PLACEHOLDER/$UUID/g" /etc/v2ray/config.json
sed -i "s|VMESS_WSPATH_PLACEHOLDER|$VMESS_WSPATH|g" /etc/v2ray/config.json
sed -i "s|VLESS_WSPATH_PLACEHOLDER|$VLESS_WSPATH|g" /etc/v2ray/config.json

# Start Supervisor
supervisord -c /supervisord.conf
