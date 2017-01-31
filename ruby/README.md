# Ruby

Light ruby image with rubygems, bundler, and compilation helper scripts.

## Usage

```bash
docker run --rm -it dhumphreys88/ruby:2.3 irb
```

## Ports

- __8311__ - Simple health check through TCP connection

## Extension

```dockerfile
FROM dhumphreys88/ruby:2.3

USER root
COPY Gemfile* /var/lib/ruby/
RUN bundle install
COPY . /var/lib/ruby/

EXPOSE 1234
CMD ["bundle", "exec", "command", "arg1", "arg2"]

USER nobody
```
