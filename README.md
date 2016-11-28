Gitlab CI
=========

[![Gitlab CI](http://dockeri.co/image/drupalwxt/gitlab-ci)][dockerhub]

An image which extends from docker official for gitlab ci overrides.

## Docker Commands

Common Docker commands you can issue to this container:

### Docker Build

```
docker build -t drupalwxt/gitlab-ci:latest .
```

### Docker Build

```
docker build -t drupalwxt/gitlab-ci:dind dind
```
### Docker Run

```
docker run -d \
    drupalwxt/gitlab-ci
```

### Docker Run (Dind)

```
$ docker run  --privileged \
  -e DOCKER_DAEMON_ARGS=--insecure-registry=http://<addr>:5000 --registry-mirror=<addr>:5000 \
  -d drupalwxt/docker:dind
```


[dockerhub]:         https://hub.docker.com/r/drupalwxt/gitlab-ci/
