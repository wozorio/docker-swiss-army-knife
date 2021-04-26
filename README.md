# docker-troubleshooting
Used to build a Docker image for troubleshooting.

<h2> Build the image </h2>

```bash
docker build . -t wozorio/troubleshooting:docker-troubleshooting-1.0.0
```

<h2> Run container interactively on Docker </h2>

```bash
docker run -it --rm wozorio/troubleshooting:docker-troubleshooting-1.0.0 /bin/bash
```

<h2> Run pod interactively on Kubernetes </h2>

```bash
kubectl run -it --rm docker-troubleshooting --image=wozorio/troubleshooting:docker-troubleshooting-1.0.0 -- /bin/bash
```
