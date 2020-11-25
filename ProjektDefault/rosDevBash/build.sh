#!/usr/bin/env bash
docker-compose build rosbase && \
docker push sausy/devshell:amd64
