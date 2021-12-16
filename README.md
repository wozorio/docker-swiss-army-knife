# Docker: Swiss Army Knife

[![GitHub](https://img.shields.io/github/license/wozorio/docker-swiss-army-knife)](https://github.com/wozorio/docker-swiss-army-knife/blob/master/LICENSE)
[![Build](https://github.com/wozorio/docker-swiss-army-knife/actions/workflows/build.yml/badge.svg)](https://github.com/wozorio/docker-swiss-army-knife/actions/workflows/build.yml)

This repository is used to build a Ubuntu-based docker image containing various tools which are useful for troubleshooting.

## Build the image

```bash
docker build --no-cache -t wozorio/swiss-army-knife:latest .
```

## Push the image to Docker Hub

```bash
docker login
docker image push wozorio/swiss-army-knife:latest
```

## Run a container interactively on Docker

```bash
docker run --name swiss-army-knife -it --rm wozorio/swiss-army-knife:latest /bin/bash
```

## Run a pod interactively on Kubernetes

```bash
kubectl run -it --rm swiss-army-knife --image=wozorio/swiss-army-knife:latest -- /bin/bash
```
