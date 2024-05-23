# Use an official V2Ray image as base
FROM v2fly/v2fly-core

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Set working directory
WORKDIR /v2ray

# Copy configuration files
COPY config.json .
COPY init.sh .
COPY manage_accounts.sh .
COPY supervisord.conf .
COPY nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 8080

# Run supervisord to manage processes
CMD ["supervisord", "-c", "supervisord.conf"]
