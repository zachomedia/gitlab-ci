NAME := drupalwxt/gitlab-ci
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)

all: gitlab-ci gitlab-ci-dind

build: all

ci: build

gitlab-ci:
	docker build -t $(NAME):$(VERSION) .

gitlab-ci-dind:
	docker build -t $(NAME):dind dind

.PHONY: \
	all \
	build \
	ci \
	gitlab-ci
	gitlab-ci-dind
