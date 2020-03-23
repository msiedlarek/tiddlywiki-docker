FROM node:13.10-alpine3.11

ENV TW_VERSION=5.1.21

RUN apk add --no-cache tini su-exec \
    && npm install -g tiddlywiki@${TW_VERSION}

EXPOSE 8080/tcp

VOLUME ["/data"]
WORKDIR /data

ENV PUID=911 PGID=911 TW_WIKI=wiki

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/sh", "-c", "exec /usr/local/bin/tiddlywiki $TW_WIKI --listen host=0.0.0.0"]
