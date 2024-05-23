# Use an official V2Ray image as base
FROM v2fly/v2fly-core

# Set working directory
WORKDIR /v2ray

# Copy configuration files
COPY config.json .
COPY init.sh .
COPY manage_accounts.sh .
COPY supervisord.conf .

# Expose necessary ports
EXPOSE 8080

# Run supervisord to manage processes
CMD ["supervisord", "-c", "supervisord.conf"]
