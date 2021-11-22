FROM alpine:latest

RUN     apk add --no-cache --virtual .build-deps ca-certificates wget \
        && mkdir /v2 \ 
        && cd v2 \
        && wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& chmod 755 v2ctl \
	&& chmod 755 v2ray \
        && chmod +x /v2/v2ray \
 	&& chgrp -R 0 /v2 \
 	&& chmod -R g+rwX /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh

COPY config.txt /v2/config.json

RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

