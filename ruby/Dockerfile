FROM dhumphreys88/alpine:3.5

# switch to root user for more permissions
USER root
RUN set -xe \

  # configure rubygems to skip documentation
  && echo -e "install: --no-document\nupdate: --no-document" >> /etc/gemrc \

  # install ruby, rubygems, bundler, and irb
  && apk add --no-cache "ruby<2.4.0" "ruby-irb<2.4.0" \
  && gem install bundler \

  # create a ruby home directory
  && mkdir -p /var/lib/ruby

# default to ruby home directory
WORKDIR /var/lib/ruby

# execute interactive ruby terminal by default
CMD ["irb"]

# run containers as nobody for security purposes
USER nobody
