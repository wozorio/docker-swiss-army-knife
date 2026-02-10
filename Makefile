SHELL = /usr/bin/env bash

.DEFAULT_GOAL = run-docker

# The Docker image to be built and run
IMAGE = "wozorio/swiss-army-knife"
TAG = "latest"

# Build the Docker image
.PHONY: build
build:
	@docker build . -f Dockerfile -t $(IMAGE):$(TAG)

# Test the Docker image by running a simple command
.PHONY: test
test:
	@docker run --name swiss-army-knife --rm $(IMAGE):$(TAG) /bin/bash -c "echo 'Hello, World!'"

# Build the Docker image and run it interactively on Docker
.PHONY: run-docker
run-docker: build
	@docker run --name swiss-army-knife -it --rm $(IMAGE):$(TAG) /bin/bash

# Build the Docker image and run it interactively on Kubernetes
.PHONY: run-k8s
run-k8s: build
	@kubectl run -it --rm swiss-army-knife --image=$(IMAGE):$(TAG) -- /bin/bash

# Lint the Dockerfile
.PHONY: lint
lint:
	@docker run \
		--interactive \
		--rm \
		--volume $(PWD)/.hadolint.yaml:/root/.config/hadolint.yaml hadolint/hadolint < Dockerfile

# Remove the Docker image
.PHONY: clean
clean:
	@docker rmi $(IMAGE):$(TAG)
