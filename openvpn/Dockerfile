FROM dhumphreys88/alpine:3.5

# run as non-root user
ENV RUN_AS openvpn

RUN set -xe \

  # create openvpn system user
  && addgroup openvpn \
  && adduser -S -G openvpn openvpn \

  # install openvpn server
  && apk add --no-cache \
    "openvpn<2.4.0" \
    "openvpn-auth-ldap<2.4.0" \
    "openvpn-auth-pam<2.4.0"

# run openvpn server on UDP port 6379
EXPOSE 1194/udp
