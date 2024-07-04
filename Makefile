SHELL = /usr/bin/env bash

# The Docker image to be built and run
IMAGE_TAG = "wozorio/swiss-army-knife:latest"

# Build the Docker image
.PHONY: build
build:
	@docker build . -f Dockerfile -t $(IMAGE_TAG)

# Test the Docker image by running a simple command
.PHONY: test
test: build
	@docker run --name swiss-army-knife --rm $(IMAGE_TAG) /bin/bash -c "echo 'Hello, World!'"

# Build the Docker image and run it interactively on Docker
.PHONY: run-docker
run-docker: build
	@docker run --name swiss-army-knife -it --rm $(IMAGE_TAG) /bin/bash

# Build the Docker image and run it interactively on Kubernetes
.PHONY: run-k8s
run-k8s: build
	@kubectl run -it --rm swiss-army-knife --image=$(IMAGE_TAG) -- /bin/bash

# Lint the Dockerfile
.PHONY: lint
lint:
	@docker run --rm -i \
		-v $(PWD)/.hadolint.yaml:/root/.config/hadolint.yaml hadolint/hadolint < Dockerfile

# Remove the Docker image
.PHONY: clean
clean:
	@docker rmi $(IMAGE_TAG)
