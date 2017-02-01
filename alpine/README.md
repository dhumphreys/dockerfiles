# Alpine Linux

Lightweight base image that reaps child processes and exposes simple TCP health check.

## Usage

```bash
docker run --rm -it dhumphreys88/alpine:3.5 [command] [args]
```

## Ports

- __8311__: Netcat health check

## Extension

```dockerfile
FROM dhumphreys88/alpine:3.5

RUN apk add --no-cache package1 package2 package3

EXPOSE 1234
CMD ["command", "arg1", "arg2"]

USER nobody
```
