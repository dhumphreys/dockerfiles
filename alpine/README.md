# Alpine Linux

Lightweight base image that reaps child processes and exposes a simple TCP health check.

## Usage

```bash
docker run --rm -it dhumphreys88/alpine:3.5 [command] [args]
```

## Ports

- __8311__ - Simple health check through TCP connection

## Extension

```dockerfile
FROM dhumphreys88/alpine:3.5

USER root
RUN apk add --no-cache package1 package2 package3

EXPOSE 1234
CMD ["command", "arg1", "arg2"]

USER nobody
```
