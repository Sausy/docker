#!/usr/bin/env bash
export $(cat .env | awk 'NR == 1')
export $(cat .env | awk 'NR == 2')

CURRETN_PATH=$(pwd)

docker-compose build rosbase && \
docker push sausy/devshell:${ARCHITECTUR}
