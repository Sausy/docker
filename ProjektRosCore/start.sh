#!/usr/bin/env bash

docker stop roscore
docker rm roscore
#docker-compose build roscore
docker-compose up -d roscore
