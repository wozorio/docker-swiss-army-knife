FROM debian:stable-slim

LABEL author="well.ozorio@gmail.com"
LABEL version="1.0.0"

RUN apt update \
    && apt dist-upgrade -y \
    && apt install -y \
    traceroute \
    curl \
    wget \
    dnsutils \
    netcat-openbsd \
    jq \
    nmap \ 
    net-tools \
    tcpdump \
    mtr-tiny \
    iperf3 \
    git \
    iproute2 \
    siege \
    apache2-utils \
    openssl \
    openssh-client \ 
    nvi \
    less \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY Dockerfile /Dockerfile

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/wozorio/docker-troubleshooting"
