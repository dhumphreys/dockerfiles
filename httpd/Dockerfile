FROM dhumphreys88/alpine:3.5

# run as non-root user; TLS on port 8433
ENV \
  RUN_AS=nobody \
  TLS_ACCEPT=8433 \
  TLS_CONNECT=8080

# create a web root directory
COPY index.html /opt/www/
WORKDIR /opt/www

# default to running httpd command
EXPOSE 8080 8043
CMD ["httpd", "-fvv", "-p", "8080"]
