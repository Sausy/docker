#!/usr/bin/env bash
docker stop roscore
docker rmi -f sausy/roscore
docker-compose build --force-rm roscore_build
