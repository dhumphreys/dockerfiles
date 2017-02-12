# Vault

A tool for managing secrets.

## Usage

```bash
docker run -d -p 8200:8200 dhumphreys88/vault:0.6
```

## Environment

- __VAULT_ROOT_TOKEN__: Root token for local testing.

## Ports

- __8200__: Vault server
- __8311__: TCP healthcheck (see [vault](../alpine/))

## Dockerfile

```dockerfile
FROM dhumphreys88/vault:0.6

# configure vault for production use
COPY config.hcl /etc/vault/

# set config file for startup command
CMD ["vault", "server", "-config=/etc/vault"]
```
