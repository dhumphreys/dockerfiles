DOCKERHUB_USER := dhumphreys88

build-all: build-alpine build-elixir build-httpd build-python build-redis build-ruby ;
push-all: push-alpine push-elixir push-httpd push-python push-redis push-ruby ;

build-alpine:
	docker build -t $(DOCKERHUB_USER)/alpine:3.5 alpine
	docker tag $(DOCKERHUB_USER)/alpine:3.5 $(DOCKERHUB_USER)/alpine:latest

build-elixir:
	docker build -t $(DOCKERHUB_USER)/elixir:1.3 elixir
	docker tag $(DOCKERHUB_USER)/elixir:1.3 $(DOCKERHUB_USER)/elixir:latest

build-httpd:
	docker build -t $(DOCKERHUB_USER)/httpd:latest httpd

build-python:
	docker build -t $(DOCKERHUB_USER)/python:2 python/2
	docker build -t $(DOCKERHUB_USER)/python:3 python/3
	docker tag $(DOCKERHUB_USER)/python:3 $(DOCKERHUB_USER)/python:latest

build-redis:
	docker build -t $(DOCKERHUB_USER)/redis:3.2 redis
	docker tag $(DOCKERHUB_USER)/redis:3.2 $(DOCKERHUB_USER)/redis:latest

build-ruby:
	docker build -t $(DOCKERHUB_USER)/ruby:2.3 ruby
	docker tag $(DOCKERHUB_USER)/ruby:2.3 $(DOCKERHUB_USER)/ruby:latest

push-alpine:
	docker push $(DOCKERHUB_USER)/alpine:3.5
	docker push $(DOCKERHUB_USER)/alpine:latest

push-elixir:
	docker push $(DOCKERHUB_USER)/elixir:1.3
	docker push $(DOCKERHUB_USER)/elixir:latest

push-httpd:
	docker push $(DOCKERHUB_USER)/httpd:latest

push-python:
	docker push $(DOCKERHUB_USER)/python:2
	docker push $(DOCKERHUB_USER)/python:3
	docker push $(DOCKERHUB_USER)/python:latest

push-redis:
	docker push $(DOCKERHUB_USER)/redis:3.2
	docker push $(DOCKERHUB_USER)/redis:latest

push-ruby:
	docker push $(DOCKERHUB_USER)/ruby:2.3
	docker push $(DOCKERHUB_USER)/ruby:latest
