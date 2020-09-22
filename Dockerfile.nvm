FROM debian:buster-slim

COPY . /app

ENV NVM_DIR         /root/.nvm
ENV NODE_VERSION    12.18.4
ENV NODE_PATH       $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH            $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    sed -i 's/deb\.debian\.org\/debian/opensource.nchc.org.tw\/debian/g' /etc/apt/sources.list && \
    apt update && \
    apt upgrade -y && \
    ln -s -f /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    apt install -y -q curl git && \
    apt autoremove --purge -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    npm install -g pm2

RUN cd /app && \
    npm install

WORKDIR /app

EXPOSE 3000

CMD ["pm2-runtime", "start", "pm2.json"]
