.PHONY: all

build:
	docker build -t haka .

start: build
	docker run --privileged -it haka