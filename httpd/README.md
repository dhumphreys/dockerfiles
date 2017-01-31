# HTTPD

Busybox static HTTP server.

## Usage

```bash
docker run -d -p 8080:8080 -v $(pwd):/var/lib/www dhumphreys88/httpd:latest
```

## Ports

- __8311__: Netcat health check
- __8080__: HTTP server

## Volumes

- __/var/lib/www__: Web root
