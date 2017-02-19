FROM dhumphreys88/alpine:stable

# run as non-root user
ENV RUN_AS ruby

# run setup script to install ruby
COPY ruby-setup.sh /usr/local/sbin/
RUN ruby-setup.sh

# default to ruby app directory
WORKDIR /opt/ruby

# execute interactive ruby terminal by default
CMD ["irb"]
