# Alpine Linux

Lightweight base image that reaps child processes and exposes simple TCP health check.

## Usage

```bash
docker run --rm -it dhumphreys88/alpine:3.5 [sh]
```

## Ports

- __8311__: Netcat health check

## Dockerfile

```dockerfile
FROM dhumphreys88/alpine:3.5

# add new packages
RUN apk add --no-cache package1 package2 package3

# set port and default command
EXPOSE 1234
CMD ["command", "arg1", "arg2"]

# run as non-root user
USER nobody
```
