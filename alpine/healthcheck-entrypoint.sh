#!/bin/sh

# run a simple TCP healthcheck server using netcat
nc -k -l 8311 &

# execute the passed command
exec $@
