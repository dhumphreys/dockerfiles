FROM dhumphreys88/alpine:3.5
RUN set -xe \

  # install snort server
  && apk add --no-cache curl snort tar \

  # download community snort rules
  && mkdir -p /etc/snort/rules \
  && curl -sSL https://snort.org/rules/community | tar xz -C /etc/snort/rules \

  # patch things up for community rules path to find the dynamicpreprocessor
  && rmdir /usr/local/lib \
  && ln -s /usr/lib /usr/local/lib \

  # remove unneeded packages
  && apk del --no-cache curl tar
