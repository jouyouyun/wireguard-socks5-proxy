#!/bin/bash

_upWireguard() {
    echo "start wireguard"

    wg-quick up config || echo "error start"
}

_downWireguard() {
    echo "stop wireguard"

    wg-quick down config || echo "error stop"
}

_upSocks5() {
    echo "start socks5"
    /usr/local/bin/v2ray -config /usr/local/bin/config.json
}

_downSocks5() {
    echo "stop socks5"
    killall v2ray || /bin/true
}

if [ -z "$@" ]; then
    _upWireguard
    _upSocks5
else
    exec "$@"
fi
