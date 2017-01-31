build-all: build-alpine build-httpd build-redis build-ruby;

build-alpine:
	docker build -t $(DOCKERHUB_USER)/alpine:3.5 alpine
	docker tag $(DOCKERHUB_USER)/alpine:3.5 $(DOCKERHUB_USER)/alpine:latest

build-httpd:
	docker build -t $(DOCKERHUB_USER)/httpd:latest httpd

build-redis:
	docker build -t $(DOCKERHUB_USER)/redis:3.2 redis
	docker tag $(DOCKERHUB_USER)/redis:3.2 $(DOCKERHUB_USER)/redis:latest

build-ruby:
	docker build -t $(DOCKERHUB_USER)/ruby:2.3 ruby
	docker tag $(DOCKERHUB_USER)/ruby:2.3 $(DOCKERHUB_USER)/ruby:latest
