#!/usr/bin/env bash

docker stop devshell
docker rm devshell

docker stop devshell_exohaptic
docker rm devshell_exohaptic

#docker-compose up -d devshell
docker-compose up -d devshell_exohaptic
