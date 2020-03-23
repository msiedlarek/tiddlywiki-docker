#!/bin/sh
set -e

if [ ! -d $TW_WIKI ]; then
    mkdir -p $TW_WIKI
    chown -R $PUID:$PGID $TW_WIKI
    su-exec $PUID:$PGID tiddlywiki $TW_WIKI --init server
fi

exec tini -- su-exec $PUID:$PGID "$@"
