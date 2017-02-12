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
