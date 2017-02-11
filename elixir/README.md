# Elixir

Elixir 1.3 with mix and hex.

## Usage

```bash
docker run --rm -it dhumphreys88/elixir:1.3 [iex]
```

## Ports

- __8311__: Netcat health check

## Dockerfile

```dockerfile
FROM dhumphreys88/elixir:2.3

# install packages and source code
COPY mix.exs mix.lock /var/lib/elixir/
RUN mix deps.get
COPY . /var/lib/elixir/

# set port and default command
EXPOSE 1234
CMD ["elixir", "script.exs"]
USER nobody
```
