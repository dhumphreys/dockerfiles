FROM dhumphreys88/alpine:3.5

# create a web root directory as a volume
RUN mkdir -p /var/lib/www
COPY index.html /var/lib/www/
VOLUME /var/lib/www
WORKDIR /var/lib/www

# default to running httpd command
EXPOSE 8080
CMD ["httpd", "-fvv", "-p", "8080"]

# run as non-root user
USER nobody
