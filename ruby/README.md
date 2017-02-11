# Ruby

Ruby 2.3 image with rubygems, irb, and bundler.

## Usage

```bash
docker run --rm -it dhumphreys88/ruby:2.3 [irb]
```

## Ports

- __8311__: Netcat health check

## Dockerfile

```dockerfile
FROM dhumphreys88/ruby:2.3

# install gems and source code
COPY Gemfile* /var/lib/ruby/
RUN bundle install
COPY . /var/lib/ruby/

# set port and default command
EXPOSE 8080
CMD ["bundle", "exec", "unicorn", "-p", "8080"]
USER nobody
```
