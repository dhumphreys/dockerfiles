#!/bin/sh
set -e

# if there are no arguments, just run vault in dev mode
if [[ $# -eq 0 ]]; then
 exec vault server \
   -dev \
   -dev-root-token-id="$VAULT_ROOT_TOKEN" \
   -dev-listen-address=0.0.0.0:8200
fi

# else, run the specified command
exec "$@"
