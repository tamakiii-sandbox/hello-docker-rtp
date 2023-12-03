.PHONY: help list info up send

AUDIO_DEVICE :=
CONTAINER_ID := $(shell docker ps -qf ancestor=tamakiii-sandbox/hello-docker-rtp)
CONTAINER_ADDRESS := $(shell docker inspect "$(CONTAINER_ID)" | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress")
CONTAINER_PORT := 16384

help:
	@cat $(firstword $(MAKEFILE_LIST))

list:
	ffmpeg -list_devices true -f dshow -i dummy

info:
	@echo CONTAINER_ADDRESS=$(CONTAINER_ADDRESS)
	@echo CONTAINER_PORT=$(CONTAINER_PORT)

up:
	ffmpeg -f dshow -i audio="$(AUDIO_DEVICE)" -acodec libopus -f rtp rtp://$(CONTAINER_ADDRESS):$(CONTAINER_PORT)

send:
	python send.py