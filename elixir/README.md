# Elixir

Elixir 1.3 with mix and hex.

## Usage

```bash
docker run --rm -it dhumphreys88/elixir:1.3 [iex]
```

## Ports

- __8311__: TCP healthcheck (see [alpine](../alpine/))

## Volumes

- __/opt/elixir__: Elixir application code

## Dockerfile

```dockerfile
FROM dhumphreys88/elixir:2.3

# install packages and source code
COPY mix.exs mix.lock /opt/elixir/
RUN mix deps.get
COPY . /opt/elixir/

# set port and default command
EXPOSE 1234
CMD ["elixir", "script.exs"]
```
