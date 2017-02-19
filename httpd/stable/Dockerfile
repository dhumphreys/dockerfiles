FROM dhumphreys88/alpine:3.4

# run as non-root user
ENV RUN_AS=nobody

# create a web root directory
COPY index.html /opt/www/
WORKDIR /opt/www

# default to running httpd command
EXPOSE 8080
CMD ["httpd", "-fvv", "-p", "8080"]
