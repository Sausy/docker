mkdir -p docker-exchange/.node-red
mkdir -p docker-exchange/controll

git clone https://github.com/Sausy/node-red-contrib-web-babylonjs.git

#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

docker rm -f mynodered > /dev/null
docker rm -f myroscore > /dev/null

docker-compose build

export $(cat .env | awk 'NR == 1')
export $(cat .env | awk 'NR == 2')

#=== parameterisize it =====
echo "======================="
echo "build done"
echo "ARCHITECTUR: $ARCHITECTUR"
echo "ROS-Version: $ROSVERSION"
echo "........................"
echo "TIP: to change these vars"
echo "edit the '.env' file"
echo "======================="
CURRETN_PATH=$(pwd)
echo ${CURRETN_PATH}/docker-exchange/.node-red:/data
#docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:1.0.6-12-minimal-arm64v8
docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:${ARCHITECTUR}
docker create -p 11311:11311 -p 9090:9090 --name myroscore roscore/${ARCHITECTUR}:${ROSVERSION}

unset ARCHITECTUR
unset ROSVERSION
