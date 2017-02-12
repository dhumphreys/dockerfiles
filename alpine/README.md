# Alpine Linux

Small, simple, secure base image that:

- Reaps sub-processes with `tini`.
- Exposes simple TCP healthcheck with `netcat`.
- Switches to non-root user with `su-exec`.

## Usage

```bash
docker run --rm -it dhumphreys88/alpine:3.5 [sh]
```

## Environment

- __RUN_AS__: If set, switch to specified user on container startup.
- __SKIP_HEALTHCHECK__: If set, do not run `netcat` health check on container startup.
- __SKIP_INIT__: If set, do not run `tini` sub-process reaper as PID 1.

## Ports

- __8311__: TCP healthcheck

## Dockerfile

```dockerfile
FROM dhumphreys88/alpine:3.5

# tell entrypoint to run as non-root user
ENV RUN_AS nobody

# add new packages
RUN apk add --no-cache package1 package2 package3

# set port and default command
EXPOSE 1234
CMD ["command", "arg1", "arg2"]
```
