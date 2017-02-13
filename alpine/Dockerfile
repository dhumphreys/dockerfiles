FROM alpine:3.5

RUN set -ex \

  # create system user for stunnel
  && addgroup stunnel \
  && adduser -S -h /var/run/stunnel -G stunnel stunnel \

  # install useful system tools for entrypoint
  && apk add --no-cache \
    netcat-openbsd \
    stunnel \
    su-exec \
    tini

# add initial stunnel configuration
COPY stunnel.conf /etc/stunnel/

# add entrypoint script for common options
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
COPY alpine-entrypoint.sh /usr/local/sbin/

# run shell by default
CMD ["sh"]
