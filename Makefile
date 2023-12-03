.PHONY: help launch

TIMEOUT := 30

help:
	@cat $(firstword $(MAKEFILE_LIST))

launch:
	timeout $(TIMEOUT) python3 main.py

send:
	python3 send.py
