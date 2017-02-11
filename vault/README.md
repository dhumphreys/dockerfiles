# Vault

A tool for managing secrets.

## Usage

```bash
docker run -d -p 8200:8200 dhumphreys88/vault:0.6
```

## Environment

- __VAULT_ROOT_TOKEN__ - Root token for local testing.

## Ports

- __8200__: Vault server
- __8311__: Netcat health check

## Dockerfile

```dockerfile
FROM dhumphreys88/vault:0.6

# configure vault for production use
USER root
COPY config.hcl /etc/vault/

# reset user and default command
CMD ["vault", "server", "-config=/etc/vault"]
USER vault
```
