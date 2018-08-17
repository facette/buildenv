BRANCH ?= master

FLAVORS = $(sort $(patsubst docker/Dockerfile.%,%,$(wildcard docker/Dockerfile.*)))

all:

clean:
	rm -rf dist/

clean-images:
	docker rmi $(FLAVORS:%=facette/buildenv:%)

images: $(FLAVORS:%=image-%)

image-%:
	-docker build -f docker/Dockerfile.$(@:image-%=%) -t facette/buildenv:$(@:image-%=%) .

release: binary debian

binary: $(filter binary-stretch-%,$(FLAVORS:%=binary-%))

binary-%:
	-docker run --rm -ti -v $(PWD)/dist:/tmp/build facette/buildenv:$(@:binary-%=%) bash -c "mkdist binary $(BRANCH)"

debian: $(FLAVORS:%=debian-%)

debian-%:
	-docker run --rm -ti -v $(PWD)/dist:/tmp/build facette/buildenv:$(@:debian-%=%) bash -c "mkdist debian $(BRANCH)"

push: $(FLAVORS:%=push-%)

push-%:
	-docker push facette/buildenv:$(@:push-%=%)
