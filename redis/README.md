# Redis

Fast key-value storage.

## Usage

```bash
docker run -d -p 6379:6379 dhumphreys88/redis:3.2
```

## Ports

- __6379/TCP__: Redis server
- __8311/TCP__: Netcat health check

## Volumes

- __/var/lib/redis__: Redis data
