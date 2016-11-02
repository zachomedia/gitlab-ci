NAME := drupalwxt/gitlab-ci
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)

all: gitlab-ci

build: all

ci: build

gitlab-ci:
	docker build -t $(NAME):$(VERSION) .

.PHONY: \
	all \
	build \
	ci \
	gitlab-ci
