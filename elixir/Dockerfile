FROM dhumphreys88/alpine:3.5

# run as non-root user
ENV RUN_AS elixir

RUN set -xe \

  # create elixir system user
  && addgroup elixir \
  && adduser -S -G elixir elixir \

  # install elixir
  && apk add --no-cache \
    "elixir<1.4.0" \
    "erlang-crypto" \

  # install hex
  && mix local.hex --force \

  # create elixir app directory
  && mkdir -p /opt/elixir

# default to elixir app directory
WORKDIR /opt/elixir

# execute interactive elixir terminal by default
CMD ["iex"]
