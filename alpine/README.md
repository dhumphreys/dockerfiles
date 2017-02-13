# Alpine Linux

Small, simple, secure base image that:

- Runs main process as non-root user using `su-exec`.
- Reaps sub-processes and forwards signals using `tini`.
- Exposes simple TCP healthcheck using `netcat`.
- Wraps traffic with TLS using `stunnel`.

## Usage

```bash
docker run --rm -it dhumphreys88/alpine:3.5 [sh]
```

### Environment

- __RUN_AS__: If set, switch to specified user on container startup.
- __SKIP_HEALTHCHECK__: If set, do not run `netcat` health check on container startup.
- __SKIP_INIT__: If set, do not run `tini` sub-process reaper as PID 1.
- __TLS_ACCEPT__: If key present, `stunnel` listens for requests on specified port.
- __TLS_CONNECT__: If key present, `stunnel` forwards requests to specified port.

### Ports

- __8311__: TCP healthcheck

### Volumes

- __/etc/tls/key.pem__: TLS key/cert bundle for `stunnel` (optional)

## Dockerfile

```dockerfile
FROM dhumphreys88/alpine:3.5

# tell entrypoint to run as non-root user
ENV RUN_AS nobody

# configure TLS port bindings
ENV TLS_ACCEPT 8433
ENV TLS_CONNECT 8080

# add new packages
RUN apk add --no-cache package1 package2 package3

# set ports and default command
EXPOSE 8080 8433
CMD ["command", "--bind", "0.0.0.0:8080", "arg1", "arg2"]
```
