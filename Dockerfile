FROM ubuntu:22.04

# Minden szükséges csomag telepítése
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    htop \
    tmux \
    openssh-client \
    xz-utils \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# tmate telepítése
RUN curl -L https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz -o /tmp/tmate.tar.xz && \
    tar -xJf /tmp/tmate.tar.xz -C /usr/local/bin --strip-components=1 && \
    rm /tmp/tmate.tar.xz && \
    chmod +x /usr/local/bin/tmate

# Munkakönyvtár
WORKDIR /root

# tmate indítása és session info megjelenítése
CMD tmate -F & sleep 10 && \
    echo "======================================" && \
    echo "TMATE SESSION INFO:" && \
    tmate display -p "SSH: #{tmate_ssh}" && \
    tmate display -p "Web: #{tmate_web}" && \
    echo "======================================" && \
    tail -f /dev/null
