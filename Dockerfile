FROM ubuntu:latest

RUN     mkdir /v2ray \
        cd /v2ray \
        wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip \
        wget https://github.com/v2ray/v2ray-core/releases/download/v4.21.3/v2ray-linux-64.zip -O v2ray.zip \
        unzip ngrok.zip \
        unzip v2ray.zip \
        rm -rf ngrok.zip v2ray.zip config.json \
        wget https://raw.githubusercontent.com/funnymdzz/v2actions/master/config.json 

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

