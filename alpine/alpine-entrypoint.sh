#!/bin/sh
set -e

# run a simple TCP healthcheck server using netcat
if [ -z "$SKIP_HEALTHCHECK" ]; then
  echo "[HEALTHCHECK] Listening on TCP port 8311"

  # if running container as root, run healthcheck as non-root user
  if [ "$(id -u)" = "0" ]; then
    su-exec nobody nc -k -l 8311 &
  else
    nc -k -l 8311 &
  fi
fi

# configure TLS wrapper if key is present
if [ -f /etc/tls/key.pem ] && [ -n "$TLS_ACCEPT" ]; then

  # error if TLS_CONNECT not set
  if [ -z "$TLS_CONNECT" ]; then
    echo "[STUNNEL] Fatal: TLS_CONNECT not set"
    exit 1
  fi

  # error if not running as root
  if [ "$(id -u)" != "0" ]; then
    echo "[STUNNEL] Fatal: run as root to use TLS wrapper"
    exit 1
  fi

  # configure TLS wrapper
  echo -e "\n[default]\naccept = $TLS_ACCEPT\nconnect = $TLS_CONNECT\n" >> /etc/stunnel/stunnel.conf

  # start TLS wrapper
  echo "[STUNNEL] Listening on TCP port $TLS_ACCEPT"
  stunnel /etc/stunnel/stunnel.conf
fi

# use tini as the init process unless asked to skip it
if [ -z "$SKIP_INIT" ]; then
  set -- /sbin/tini -- $@
fi

# descalate permissions to non-root user if starting as root and RUN_AS is set
if [ -n "$RUN_AS" ] && [ "$(id -u)" = "0" ]; then
  set -- su-exec "$RUN_AS" $@
fi

# execute the passed command
exec $@
