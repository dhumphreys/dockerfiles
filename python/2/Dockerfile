FROM dhumphreys88/alpine:3.5
RUN set -xe \

  # install python 2
  && apk add --no-cache curl python2 \

  # install pip package manager
  && curl -sSL https://bootstrap.pypa.io/get-pip.py | python - \

  # create a python home directory
  && mkdir -p /var/lib/python \

  # remove unused packages
  && apk del --no-cache curl

# default to ruby home directory
WORKDIR /var/lib/python

# execute interactive python terminal by default
CMD ["python"]
