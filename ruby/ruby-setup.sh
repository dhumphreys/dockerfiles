#!/bin/sh
set -e

# create ruby system user
addgroup ruby
adduser -S -G ruby ruby

# configure rubygems to skip documentation
echo -e "install: --no-document\nupdate: --no-document" >> /etc/gemrc \

# install ruby, rubygems, bundler, and irb
apk add --no-cache \
  ruby \
  ruby-bigdecimal \
  ruby-bundler \
  ruby-irb

# create list of tags for this ruby version
RUBY_VERSION=$(ruby --version | awk '{ print $2 }')
RUBY_VERSION=${RUBY_VERSION%p*}
echo ${RUBY_VERSION%.*} > /TAGS
echo ${RUBY_VERSION} >> /TAGS

# create a ruby app directory
mkdir -p /opt/ruby

# self destruct
rm -- "$0"
