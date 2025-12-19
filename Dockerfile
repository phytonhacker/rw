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

# tmate indítása socket-tel
CMD tmate -S /tmp/tmate.sock new-session -d && \
    tmate -S /tmp/tmate.sock wait tmate-ready && \
    echo "======================================" && \
    echo "TMATE SESSION INFO:" && \
    tmate -S /tmp/tmate.sock display -p "SSH: #{tmate_ssh}" && \
    tmate -S /tmp/tmate.sock display -p "Web: #{tmate_web}" && \
    echo "======================================" && \
    echo "Session running! Use the links above to connect." && \
    tail -f /dev/null
