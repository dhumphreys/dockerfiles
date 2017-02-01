# Ruby

Ruby 2.3 image with rubygems, irb, and bundler.

## Usage

```bash
docker run --rm -it dhumphreys88/ruby:2.3 irb
```

## Ports

- __8311__: Netcat health check

## Extension

```dockerfile
FROM dhumphreys88/ruby:2.3

COPY Gemfile* /var/lib/ruby/
RUN bundle install
COPY . /var/lib/ruby/

EXPOSE 1234
CMD ["bundle", "exec", "command", "arg1", "arg2"]

USER nobody
```
