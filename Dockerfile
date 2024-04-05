FROM ubuntu:24.04

LABEL author="well.ozorio@gmail.com"

ARG USER=wozorio

ARG DEBIAN_FRONTEND=noninteractive

RUN useradd --create-home $USER

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
    traceroute \
    telnet \
    ca-certificates \
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
    && wget -q http://www.vdberg.org/~richard/tcpping -O /usr/local/bin/tcping \
    && chmod 755 /usr/local/bin/tcping \
    # Clean up cache and temporary files
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY Dockerfile /Dockerfile

WORKDIR /home/$USER

USER $USER
