FROM debian:13

RUN apt update  && apt install -y \
    procps \
    iproute2 \
    iputils-ping \
    bind9 \
    vim \
    bind9utils \
    rsyslog \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# COPY named.conf.options /etc/bind/named.conf.options
RUN mkdir -p /dns
COPY entrypoint.sh /dns
RUN chmod a+x /dns/entrypoint.sh
EXPOSE 53
# USER bind
WORKDIR /var/cache/bind

RUN sed -i "s/^\\s*module(load=\"imklog\")/#module(load=\"imklog\")/" /etc/rsyslog.conf

CMD ["-4"]

ENTRYPOINT ["/dns/entrypoint.sh"]

