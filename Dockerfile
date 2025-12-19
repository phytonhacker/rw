FROM ubuntu:22.04

# Telepítsd amit akarsz
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    htop \
    tmux \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# tmate telepítése
RUN curl -L https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz | tar -xJ -C /usr/local/bin --strip-components=1

# Munkakönyvtár
WORKDIR /root

# Indítási script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Indítsd el
CMD ["/start.sh"]
