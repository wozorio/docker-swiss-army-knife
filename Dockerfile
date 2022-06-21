FROM ubuntu:22.04

LABEL author="well.ozorio@gmail.com"

WORKDIR /root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt dist-upgrade -y \
    && apt install --no-install-recommends -y \
    traceroute \
    telnet \
    curl \
    wget \
    iputils-ping \
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
    # Install tcping
    tcptraceroute \
    bc \
    && wget http://www.vdberg.org/~richard/tcpping -O /usr/local/bin/tcping \
    && chmod 755 /usr/local/bin/tcping \
    # Clean up cache and temporary files
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY Dockerfile /Dockerfile
