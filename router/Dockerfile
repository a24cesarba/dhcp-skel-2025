FROM debian:13

RUN apt update  && apt install -y \
    procps \
    iproute2 \
    iputils-ping \
    bind9utils \
    dnsutils \
    tcpdump \
    dhcp-helper \
    nftables \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 777 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]