FROM alpine:3.4

# run setup script to install necessary packages
COPY alpine-setup.sh /usr/local/sbin/
RUN alpine-setup.sh

# copy default configuration files
COPY stunnel.conf /etc/stunnel/

# configure default entrypoint and command
COPY alpine-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
CMD ["sh"]
