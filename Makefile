DOCKERHUB_USER := dhumphreys88

build-all: build-alpine build-elixir build-httpd build-python build-rabbitmq build-redis build-ruby build-vault ;
push-all: push-alpine push-elixir push-httpd push-python push-rabbitmq push-redis push-ruby push-vault ;

#--------#
# Macros #
#--------#

define push_image_tags
	docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}" --no-trunc $(DOCKERHUB_USER)/$(1) \
	| grep "$$(docker inspect --format "{{.Id}}" $(DOCKERHUB_USER)/$(1):$(2))" \
	| awk '{ print $$1 }' \
	| xargs -n 1 docker push
endef

define tag_image_versions
	docker run --rm --entrypoint /bin/cat $(DOCKERHUB_USER)/$(1):$(2) /TAGS \
	| awk '{ print "$(DOCKERHUB_USER)/$(1):" $$1 }' \
	| xargs -n 1 docker tag $(DOCKERHUB_USER)/$(1):$(2)
endef

#--------------#
# Docker Build #
#--------------#

build-%: build/%/all tag-% ;

build/%/all: build/%/latest build/%/stable build/%/edge ;

build/%/latest: %/Dockerfile
	docker build -f $< -t $(DOCKERHUB_USER)/$*:latest $*

build/%/stable: %/stable/Dockerfile | build/%/latest
	docker build -f $< -t $(DOCKERHUB_USER)/$*:stable $*

build/%/edge: %/edge/Dockerfile | build/%/latest build/%/stable
	docker build -f $< -t $(DOCKERHUB_USER)/$*:edge $*

build/%: %/Dockerfile | build/$(*D)/latest build/%/stable build/%/edge
	docker build -f $< -t $(DOCKERHUB_USER)/$(*D):$(*F) $(*D)

build-elixir:
	docker build -t $(DOCKERHUB_USER)/elixir:1.3 elixir
	docker tag $(DOCKERHUB_USER)/elixir:1.3 $(DOCKERHUB_USER)/elixir:latest

build-httpd:
	docker build -t $(DOCKERHUB_USER)/httpd:latest httpd

build-python:
	docker build -t $(DOCKERHUB_USER)/python:2 python/2
	docker build -t $(DOCKERHUB_USER)/python:3 python/3
	docker tag $(DOCKERHUB_USER)/python:3 $(DOCKERHUB_USER)/python:latest

build-rabbitmq:
	docker build -t $(DOCKERHUB_USER)/rabbitmq:3.6 rabbitmq
	docker tag $(DOCKERHUB_USER)/rabbitmq:3.6 $(DOCKERHUB_USER)/rabbitmq:latest

build-redis:
	docker build -t $(DOCKERHUB_USER)/redis:3.2 redis
	docker tag $(DOCKERHUB_USER)/redis:3.2 $(DOCKERHUB_USER)/redis:latest

build-vault:
	docker build -t $(DOCKERHUB_USER)/vault:0.6 vault
	docker tag $(DOCKERHUB_USER)/vault:0.6 $(DOCKERHUB_USER)/vault:latest

#-------------#
# Docker Push #
#-------------#

push-%: push/%/edge push/%/stable push/%/latest ;

push/%/latest: %/Dockerfile
	@$(call push_image_tags,$*,latest)

push/%: %/Dockerfile
	@$(call push_image_tags,$(*D),$(*F))

push-elixir:
	docker push $(DOCKERHUB_USER)/elixir:1.3
	docker push $(DOCKERHUB_USER)/elixir:latest

push-httpd:
	docker push $(DOCKERHUB_USER)/httpd:latest

push-python:
	docker push $(DOCKERHUB_USER)/python:2
	docker push $(DOCKERHUB_USER)/python:3
	docker push $(DOCKERHUB_USER)/python:latest

push-rabbitmq:
	docker push $(DOCKERHUB_USER)/rabbitmq:3.6
	docker push $(DOCKERHUB_USER)/rabbitmq:latest

push-redis:
	docker push $(DOCKERHUB_USER)/redis:3.2
	docker push $(DOCKERHUB_USER)/redis:latest

push-vault:
	docker push $(DOCKERHUB_USER)/vault:0.6
	docker push $(DOCKERHUB_USER)/vault:latest

#------------#
# Docker Tag #
#------------#

tag-%: tag/%/all | build/%/all ;

tag/%/all: | build/%/latest build/%/stable build/%/edge
	@echo "No tags for $(DOCKERHUB_USER)/$*"

tag/%/latest: | build/%/latest tag/%/stable tag/%/edge
	@echo "Tagging $(DOCKERHUB_USER)/$*:latest"
	@$(call tag_image_versions,$*,latest)

tag/%/stable: | build/%/stable tag/%/edge
	@echo "Tagging $(DOCKERHUB_USER)/$*:stable"
	@$(call tag_image_versions,$*,stable)

tag/%/edge: | build/%/edge
	@echo "Tagging $(DOCKERHUB_USER)/$*:edge"
	@$(call tag_image_versions,$*,edge)

tag/%: | build/% tag/$(*D)/latest tag/$(*D)/stable tag/$(*D)/edge
	@echo "Tagging $(DOCKERHUB_USER)/$(*D):$(*F)"
	@$(call tag_image_versions,$(*D),$(*F))

tag/alpine/all: tag/alpine/stable tag/alpine/latest ;

tag/ruby/all: tag/ruby/edge tag/ruby/stable tag/ruby/latest ;
