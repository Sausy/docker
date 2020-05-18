mkdir -p docker-exchange/.node-red
mkdir -p docker-exchange/controll

git clone https://github.com/ahmadsayed/node-red-contrib-web-babylonjs.git

docker-compose build

#=== parameterisize it =====
CURRETN_PATH=$(pwd)
docker rm -f mynodered > /dev/null
docker rm -f myroscore > /dev/null
docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data nodered/node-red:1.0.6-12-minimal-arm64v8
docker create -p 11311:11311 --name myroscore -v ${CURRETN_PATH}/docker-exchange/controll:/data roscore/x64:melodic
