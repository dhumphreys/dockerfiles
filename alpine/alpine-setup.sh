#!/bin/sh
set -ex

# create system user for stunnel
addgroup stunnel
adduser -S -h /var/run/stunnel -G stunnel stunnel

# download apk package list
apk update

# install system tools for entrypoint
apk add \
  ca-certificates \
  netcat-openbsd \
  su-exec \
  tini

# install stunnel if it is available
if apk info stunnel > /dev/null; then
  apk add stunnel
fi

# create list of tags for this alpine version
ALPINE_VERSION=$(cat /etc/alpine-release)
echo ${ALPINE_VERSION%.*} > /TAGS
echo ${ALPINE_VERSION} >> /TAGS

# purge apk package list
rm -rf /var/cache/apk/*

# self destruct
rm -- "$0"
