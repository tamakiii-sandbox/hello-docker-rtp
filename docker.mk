.PHONY: help info build bash clean

IMAGE_NAME = "tamakiii-sandbox/hello-docker-rtp"

help:
	@cat $(firstword $(MAKEFILE_LIST))

info:
	docker inspect $(shell docker ps -qf "ancestor=$(IMAGE_NAME)") | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress"

build: Dockerfile
	docker build -t $(IMAGE_NAME) .

bash:
	docker run --rm -it -e TZ=Asia/Tokyo -v $(shell pwd):/app -w /app -p 16384:16384/udp $(IMAGE_NAME) bash

clean:
	docker rmi $(IMAGE_NAME)
