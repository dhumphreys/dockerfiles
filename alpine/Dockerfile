FROM alpine:3.5

# install tini to reap child processes
RUN apk add --no-cache netcat-openbsd tini

# add check script to expose external TCP health checks
EXPOSE 8311
COPY healthcheck-entrypoint.sh /usr/local/bin/

# wrap all commands in tini and healthcheck executables
ENTRYPOINT ["/sbin/tini", "--", "healthcheck-entrypoint.sh"]

# run interactive shell by default
CMD ["sh"]

# run containers as guest user to be safe
USER guest
