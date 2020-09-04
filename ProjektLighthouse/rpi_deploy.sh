#!#!/usr/bin/env bash
echo "this script just increases deployment speed"
echo "but it needs modifications and prebuild images"
echo "if you uncertain about it just use ...build..."
echo "and get a coffee"

echo "(change docker hub name to a name where you rosbase can be found)"
echo "(usfull cmd docker tag rosbase/arm64:melodic sausy/rosbase:latest)"

DOCKER_HUB_NAME="sausy/rosbase:latest"

docker pull $DOCKER_HUB_NAME

docker tag $DOCKER_HUB_NAME rosbase/arm64:melodic

#echo "FROM ${DOCKER_HUB_NAME}" \
#>> tempDockerFile

#docker build -t rosbase/arm64:melodic - < tempDockerFile

#rm tempDockerFile
