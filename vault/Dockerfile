FROM dhumphreys88/alpine:3.5

# set version of vault we want
ENV \
  VAULT_VERSION=0.6.4 \
  VAULT_MD5=d5a58680c9fa94f7fbad6cf6bfd5ebff \
  VAULT_ADDR=https://127.0.0.1:8200

# set download url for vault version
ENV VAULT_DOWNLOAD_URL=https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

# download and install vault binary
RUN set -xe \
  && addgroup vault \
  && adduser -S -G vault vault \
  && apk add --no-cache --virtual .build-deps \
    ca-certificates \
    wget \
  && wget -qO vault.zip $VAULT_DOWNLOAD_URL \
  && echo "$VAULT_MD5  vault.zip" | md5sum -c \
  && unzip vault.zip -d /usr/local/bin/ \
  && chmod +x /usr/local/bin/vault \
  && rm vault.zip \
  && apk del --no-cache .build-deps

# copy vault entrypoint script to image
COPY vault-entrypoint.sh /usr/local/bin/

# expose vault port and run through entrypoint
EXPOSE 8200
ENTRYPOINT ["/sbin/tini", "--", "healthcheck-entrypoint.sh", "vault-entrypoint.sh"]
USER vault
