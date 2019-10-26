#!/bin/sh

set -e

PUID=${PUID:=0}
PGID=${PGID:=0}

if [ ! -f /aria2/config/aria2.conf ]; then
    cp /aria2/aria2.conf /aria2/config/aria2.conf
    chown $PUID:$PGID /aria2/config/aria2.conf
fi

if [ ! -f /aria2/config/aria2.session ]; then
    touch /aria2/config/aria2.session
    chown $PUID:$PGID /aria2/config/aria2.session
fi

if [ ! -f /aria2/logs.txt ]; then
    touch /aria2/logs.txt
    chown $PUID:$PGID /aria2/logs.txt
fi

aria2c --conf-path=/aria2/config/aria2.conf --log=/aria2/logs.txt --enable-rpc --rpc-listen-all
# aria2c --no-conf --enable-rpc --rpc-listen-all