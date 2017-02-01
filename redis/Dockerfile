FROM dhumphreys88/alpine:3.5
RUN set -xe \

  # install redis server
  && apk add --no-cache redis \

  # create redis data directory
  && mkdir -p /var/lib/redis \
  && chown redis:redis /var/lib/redis

# make data directory a volume
VOLUME /var/lib/redis
WORKDIR /var/lib/redis

# add config file for redis
COPY redis.conf /etc/redis.conf

# run redis server on port 6379
EXPOSE 6379
CMD ["redis-server", "/etc/redis.conf"]

# run as non-root user
USER redis
