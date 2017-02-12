FROM dhumphreys88/alpine:3.5

# rabbitmq version and configuration
ENV \
  RABBITMQ_VERSION=3.6.6 \
  RABBITMQ_HOME=/opt/rabbitmq

RUN set -xe \

  # create rabbitmq system user
  && addgroup rabbitmq \
  && adduser -S -G rabbitmq rabbitmq \

  # install erlang
  && apk add --no-cache --virtual .run-deps \
    erlang-asn1 \
    erlang-hipe \
    erlang-crypto \
    erlang-eldap \
    erlang-inets \
    erlang-mnesia \
    erlang \
    erlang-os-mon \
    erlang-public-key \
    erlang-sasl \
    erlang-ssl \
    erlang-syntax-tools \
    erlang-xmerl \

  # install rabbitmq
  && mkdir -p "$RABBITMQ_HOME" \
  && apk add --no-cache --virtual .build-deps \
    curl \
    tar \
    xz \
  && curl -sSL "https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz" | tar -Jx --strip-components 1 -C "$RABBITMQ_HOME"  \
  && apk del .build-deps \

  # setup permissions on key rabbitmq directories
  && mkdir -p "$RABBITMQ_HOME/var" \
  && chown -R rabbitmq:rabbitmq /opt/rabbitmq/var

# default to running rabbitmq server
EXPOSE 5672
CMD ["/opt/rabbitmq/sbin/rabbitmq-server"]

# run as non-root user
USER rabbitmq
