FROM dhumphreys88/alpine:3.5

# run as non-root user
ENV RUN_AS python

RUN set -xe \

  # create python system user
  && addgroup python \
  && adduser -S -G python python \

  # install python 2
  && apk add --no-cache curl python2 \

  # install pip package manager
  && curl -sSL https://bootstrap.pypa.io/get-pip.py | python - \

  # create a python app directory
  && mkdir -p /opt/python \

  # remove unused packages
  && apk del --no-cache curl

# default to python app directory
WORKDIR /opt/python

# execute interactive python terminal by default
CMD ["python"]
