#!/bin/bash

# Create an empty accounts file
touch accounts.txt

# Start V2Ray in the background
/usr/bin/v2ray/v2ray -config=config.json &
