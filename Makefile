build-all: build-alpine build-httpd ;

build-alpine:
	docker build -t $(DOCKERHUB_USER)/alpine:3.5 alpine
	docker tag $(DOCKERHUB_USER)/alpine:3.5 $(DOCKERHUB_USER)/alpine:latest

build-httpd:
	docker build -t $(DOCKERHUB_USER)/httpd:latest httpd
