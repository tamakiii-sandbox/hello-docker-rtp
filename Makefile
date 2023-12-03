.PHONY: help info launch send

TIMEOUT := 30
INTERFACE := eth0
IP_ADDRESS = $(shell python3 address.py | jq -r '.[] | select(.interface == "$(INTERFACE)").ip_address')
MESSAGE :=

help:
	@cat $(firstword $(MAKEFILE_LIST))

info:
	@echo IP_ADDRESS=$(IP_ADDRESS)

launch:
	timeout $(TIMEOUT) python3 main.py

send:
	python3 send.py --host $(IP_ADDRESS) --message $(MESSAGE)
