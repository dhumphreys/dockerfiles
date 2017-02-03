FROM dhumphreys88/alpine:3.5
RUN set -xe \

  # install elixir
  && apk add --no-cache \
    "elixir<1.4.0" \
    "erlang-crypto" \

  && mix local.hex --force \

  # create an elixir home directory
  && mkdir -p /var/lib/elixir

# default to elixir home directory
WORKDIR /var/lib/elixir

# execute interactive elixir terminal by default
CMD ["iex"]
