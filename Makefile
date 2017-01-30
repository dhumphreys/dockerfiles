build-all: build-alpine ;

build-alpine:
	docker build -t $(DOCKERHUB_USER)/alpine:3.5 alpine/3.5
	docker tag $(DOCKERHUB_USER)/alpine:3.5 $(DOCKERHUB_USER)/alpine:latest
