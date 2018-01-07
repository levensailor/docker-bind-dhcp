all: build

build:
	@docker build --tag=devspyrosv/bind-dhcp-webmin .
