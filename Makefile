BRANCH ?= master

FLAVORS = $(sort $(patsubst docker/Dockerfile.%,%,$(wildcard docker/Dockerfile.*)))

all: build

clean: $(FLAVORS:%=clean-%)

clean-%:
	-docker rmi $(@:clean-%=facette/buildenv:%)

build: $(FLAVORS:%=build-%)

build-%:
	-docker build -f docker/Dockerfile.$(@:build-%=%) -t facette/buildenv:$(@:build-%=%) .

push: $(FLAVORS:%=push-%)

push-%:
	-docker push facette/buildenv:$(@:push-%=%)
