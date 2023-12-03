.PHONY: help build bash clean

IMAGE_NAME = "tamakiii-sandbox/hello-docker-rtp"

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE_NAME) .

bash:
	docker run --rm -it -e TZ=Asia/Tokyo $(IMAGE_NAME) bash

clean:
	docker rmi $(IMAGE_NAME)
