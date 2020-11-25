#!/usr/bin/env bash

docker stop devshell
docker rm devshell
#docker-compose build devshell
docker-compose up -d devshell
