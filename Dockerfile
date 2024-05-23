FROM v2fly/v2fly-core

ENV UUID=${UUID}
ENV VMESS_WSPATH=${VMESS_WSPATH}
ENV VLESS_WSPATH=${VLESS_WSPATH}

COPY config.json /etc/v2ray/config.json
EXPOSE 8080

ENTRYPOINT ["v2ray", "-config=/etc/v2ray/config.json"]
