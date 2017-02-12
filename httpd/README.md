# HTTPD

Busybox static HTTP server.

## Usage

```bash
docker run -d -p 8080:8080 -v $(pwd):/opt/www dhumphreys88/httpd:latest
```

## Ports

- __8080__: HTTP server
- __8311__: TCP healthcheck (see [alpine](../alpine/))

## Volumes

- __/opt/www__: Web root
