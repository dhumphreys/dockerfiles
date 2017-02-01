# Ruby

Python 2 and 3 images with pip package manager.

## Usage

```bash
docker run --rm -it dhumphreys88/python:2 [python]
docker run --rm -it dhumphreys88/python:3 [python3]
```

## Ports

- __8311__: Netcat health check

## Extension

```dockerfile
FROM dhumphreys88/python:3

COPY requirements.txt /var/lib/python/
RUN pip install -r requirements.txt
COPY . /var/lib/python/

EXPOSE 1234
CMD ["python3", "script.py", "arg1", "arg2"]

USER nobody
```
