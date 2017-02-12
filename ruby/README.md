# Ruby

Ruby 2.3 with rubygems, bundler, and irb.

## Usage

```bash
docker run --rm -it dhumphreys88/ruby:2.3 [irb]
```

## Ports

- __8311__: TCP healthcheck (see [alpine](../alpine/))

## Volumes

- __/opt/ruby__: Ruby application code

## Dockerfile

```dockerfile
FROM dhumphreys88/ruby:2.3

# install gems and source code
COPY Gemfile* /opt/ruby/
RUN bundle install
COPY . /opt/ruby/

# set port and default command
EXPOSE 8080
CMD ["bundle", "exec", "unicorn", "-p", "8080"]
```
