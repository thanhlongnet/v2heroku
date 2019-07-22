FROM alpine:latest

ENV CONFIG_JSON=none CERT_PEM=none KEY_PEM=none VER=4.20.0

RUN apk add --no-cache --virtual .build-deps ca-certificates wget \
        && mkdir /v2raybin \ 
        && cd v2raybin \
        && wget --no-check-certificate -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& chmod 777 v2ctl \
	&& chmod 777 v2ray \
        && echo -e "$CONFIG_JSON" > config.json

COPY config.txt /v2raybin/config.json
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
