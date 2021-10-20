# Docker: Swiss Army Knife

This repository is used to build a Ubuntu-based docker image containing various tools which are useful for troubleshooting.

## Build the image

```bash
docker build --no-cache -t wozorio/troubleshooting:docker-troubleshooting-1.0.0 .
```

## Push the image to Docker hub

```bash
docker login
docker image push wozorio/troubleshooting:docker-troubleshooting-1.0.0
```

## Run container interactively on Docker

```bash
docker run -it --rm wozorio/troubleshooting:docker-troubleshooting-1.0.0 /bin/bash
```

## Run pod interactively on Kubernetes

```bash
kubectl run -it --rm docker-troubleshooting --image=wozorio/troubleshooting:docker-troubleshooting-1.0.0 -- /bin/bash
```
