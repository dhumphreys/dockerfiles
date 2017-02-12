FROM dhumphreys88/alpine:3.5

# run as non-root user
ENV RUN_AS ruby

RUN set -xe \

  # create ruby system user
  && addgroup ruby \
  && adduser -S -G ruby ruby \

  # configure rubygems to skip documentation
  && echo -e "install: --no-document\nupdate: --no-document" >> /etc/gemrc \

  # install ruby, rubygems, bundler, and irb
  && apk add --no-cache "ruby<2.4.0" "ruby-irb<2.4.0" \
  && gem install bundler \

  # create a ruby app directory
  && mkdir -p /opt/ruby

# default to ruby app directory
WORKDIR /opt/ruby

# execute interactive ruby terminal by default
CMD ["irb"]
