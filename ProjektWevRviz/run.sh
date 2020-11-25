#!/usr/bin/env bash

#IMAGE=rvizweb

#docker run -d --privileged --rm --name "sausy/rvizweb" -t "amd64" --network="host" "${IMAGE}"
docker stop rvizweb
docker rm rvizweb
docker run -d --rm --network="host" --name rvizweb sausy/rvizweb:melodic
