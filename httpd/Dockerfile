FROM dhumphreys88/alpine:3.5

# switch to root user for more permissions
USER root

# create a web root directory as a volume
RUN mkdir -p /var/www
COPY index.html /var/www/
VOLUME /var/www
WORKDIR /var/www

# default to running httpd command
EXPOSE 8080
CMD ["httpd", "-fvv", "-p", "8080", "-h", "/var/www"]

# run containers as nobody for security purposes
USER nobody
