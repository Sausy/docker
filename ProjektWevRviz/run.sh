#!/usr/bin/env bash

#IMAGE=rvizweb

#docker run -d --privileged --rm --name "sausy/rvizweb" -t "amd64" --network="host" "${IMAGE}"
docker run -d --privileged --rm --network="host" --name rvizweb -t rvizweb sausy/rvizweb:melodic
