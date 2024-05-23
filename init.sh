#!/bin/bash

# Initialize V2Ray
if [ ! -f /etc/v2ray/config.json ]; then
    cp /config.json /etc/v2ray/config.json
fi

# Start Supervisor
supervisord -c /supervisord.conf
