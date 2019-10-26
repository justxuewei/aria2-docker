FROM alpine:latest

LABEL AUTHOR=xavierniu<a@nxw.name>

ENV PUID=1000
ENV PGID=1000
ENV RPC_PORT=6800

RUN mkdir -p /aria2/config \
    && mkdir -p /aria2/downloads \
    && apk add aria2

ADD start.sh aria2.conf /aria2/

WORKDIR /aria2

RUN chmod +x /aria2/start.sh

VOLUME /aria2/config
VOLUME /aria2/downloads

EXPOSE ${ARIA2_PORT}

CMD ["/aria2/start.sh"]