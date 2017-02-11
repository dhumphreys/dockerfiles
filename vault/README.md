# Vault

A tool for managing secrets.

## Usage

```bash
docker run -d -p 8200:8200 dhumphreys88/vault:0.6
docker run -d -p 8200:8200 --env VAULT_ROOT_TOKEN=0fc09d0e-6e42-27a8-f96b-0a8aa5f0e3ff dhumphreys88/vault:0.6
```

## Ports

- __8200__: Vault server
- __8311__: Netcat health check

## Example

```dockerfile
FROM dhumphreys88/vault:0.6

# configure vault for production use
USER root
COPY config.hcl /etc/vault/

# reset user and default command
CMD ["vault", "server", "-config=/etc/vault"]
USER vault
```
