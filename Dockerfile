FROM ubuntu:24.04

LABEL author="well.ozorio@gmail.com"

ARG USER=wozorio
RUN useradd --create-home $USER

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
    apache2-utils \
    bc \
    ca-certificates \
    curl \
    dnsutils \
    git \
    iperf3 \
    iproute2 \
    iputils-ping \
    jq \
    less \
    mtr-tiny \
    net-tools \
    netcat-openbsd \
    nmap \
    nvi \
    openssl \
    openssh-client \
    siege \
    tcpdump \
    telnet \
    traceroute \
    wget \
    # Install tcping
    tcptraceroute \
    && curl -sSL -o /usr/local/bin/tcping http://www.vdberg.org/~richard/tcpping \
    && chmod 755 /usr/local/bin/tcping \
    # Clean up cache and temporary files
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

COPY Dockerfile /Dockerfile

WORKDIR /home/$USER

USER $USER
