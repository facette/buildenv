BRANCH ?= master

FLAVORS = $(sort $(patsubst docker/Dockerfile.%,%,$(wildcard docker/Dockerfile.*)))

all:

clean-images:
	docker rmi $(FLAVORS:%=facette/build:%)

images: $(FLAVORS:%=image-%)

image-%:
	docker build -f docker/Dockerfile.$(@:image-%=%) -t facette/build:$(@:image-%=%) .

release: binary debian

binary: $(filter binary-stretch-%,$(FLAVORS:%=binary-%))

binary-%:
	-docker run --rm -ti -v $(PWD)/dist:/tmp/build facette/build:$(@:binary-%=%) bash -c "mkdist binary $(BRANCH)"

debian: $(FLAVORS:%=debian-%)

debian-%:
	-docker run --rm -ti -v $(PWD)/dist:/tmp/build facette/build:$(@:debian-%=%) bash -c "mkdist debian $(BRANCH)"
