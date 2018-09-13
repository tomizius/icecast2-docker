#!/bin/sh

env

set -x

if [ -n "$ICE_SOURCE_PASS" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICE_SOURCE_PASS<\/source-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$ICE_RELAY_PASS" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICE_RELAY_PASS<\/relay-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$ICE_ADMIN_PASS" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICE_ADMIN_PASS<\/admin-password>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$ICE_PORT" ]; then
    sed -i "s/<port>[^<]*<\/port>/<port>$ICE_PORT<\/port>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$HOSTNAME<\/hostname>/g" /etc/icecast2/icecast.xml
fi

if [ -n "$ICE_MAX_CLIENTS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICE_MAX_CLIENTS<\/clients>/g" /etc/icecast2/icecast.xml
fi

set -e

sudo -Eu icecast2 icecast2 -n -c /etc/icecast2/icecast.xml
