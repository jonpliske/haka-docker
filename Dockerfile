FROM debian:latest

RUN apt-get update && apt-get install -y \
    rsyslog \
    net-tools \
    iptables \
    curl \
    git \
    vim \
    tmux \
    tcpdump \
    rsync

RUN service rsyslog start

# haka deps
RUN apt-get update && apt-get install -y \
    libpcap0.8 \
    libgeoip1 \
    libnetfilter-queue1

RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY fetch-debs.sh .
RUN ./fetch-debs.sh

RUN dpkg -i \
    haka_0.3.0_amd64.deb \
    haka-geoip_0.3.0_amd64.deb \
    haka-nfqueue_0.3.0_amd64.deb


WORKDIR /usr/share/haka/sample

CMD bash
# CMD ["haka", "-d", "-c", "gettingstarted.conf", "--no-daemon"]

