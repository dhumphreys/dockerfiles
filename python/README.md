# Python

Python 2 and 3 images with pip package manager.

## Usage

```bash
docker run --rm -it dhumphreys88/python:2 [python]
docker run --rm -it dhumphreys88/python:3 [python3]
```

## Ports

- __8311__: Netcat health check

## Django App

```dockerfile
FROM dhumphreys88/python:3

# install packages and source code
COPY requirements.txt /var/lib/python/
RUN pip install -r requirements.txt
COPY . /var/lib/python/

# set port and default command
EXPOSE 8080
CMD ["python3", "myapp.py", "0.0.0.0:8080"]
USER nobody
```
