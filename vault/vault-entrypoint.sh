#!/bin/sh
set -e

# if there are no arguments, just run vault in dev mode
if [[ $# -eq 0 ]]; then
 set -- vault server \
   -dev \
   -dev-root-token-id="$VAULT_ROOT_TOKEN" \
   -dev-listen-address=0.0.0.0:8200
fi

# run through alpine entrypoint
exec alpine-entrypoint.sh $@
