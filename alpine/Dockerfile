FROM alpine:3.5

# allow access to healthcheck port
EXPOSE 8311

# install useful system tools for entrypoint
RUN apk add --no-cache \
  netcat-openbsd \
  su-exec \
  tini

# add entrypoint script for common options
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
COPY alpine-entrypoint.sh /usr/local/sbin/

# run shell by default
CMD ["sh"]
