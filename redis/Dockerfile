FROM dhumphreys88/alpine:3.5

# switch to root user for more permissions
USER root
RUN set -xe \

  # add new user and group for redis
  && addgroup -S redis \
  && adduser -S -G redis redis \

  # install redis server
  && apk add --no-cache redis \

  # create a redis data directory
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

# run containers as redis for security purposes
USER redis
