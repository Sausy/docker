mkdir -p docker-exchange/.node-red
mkdir -p docker-exchange/controll

git clone https://github.com/Sausy/node-red-contrib-web-babylonjs.git

#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

echo "clear old builds"
docker network disconnect rosnet myinterface
docker stop mynodered
docker stop myroscore
docker stop myinterface
docker rm -f mynodered > /dev/null
docker rm -f myroscore > /dev/null
docker rm -f myinterface > /dev/null

read -p "(re)build docker images?" -n 1 -r
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
 echo "start building images"
 docker-compose build
fi

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
echo "Create virtual net for container"
echo "virtual net for ros container communication"
docker network rm rosnet
docker network create --subnet=10.10.0.0/24 rosnet

echo "Create containers that will start with device bootup"
docker run -d --restart always -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:${ARCHITECTUR}
docker run -d --restart always --net rosnet --ip 10.10.0.2 -p 9090:9090 -p 11311:11311 --name myroscore roscore/${ARCHITECTUR}:${ROSVERSION}
#docker run -d --restart always --net rosnet --ip 10.10.0.10 -p 192.168.1.1:8002:8002/udp -p 8001:8001/udp -p 192.168.1.1:8000:8000/udp -p 4210:4210/udp -v ${CURRETN_PATH}/docker-exchange/src:/src -v ${CURRETN_PATH}/docker-exchange/lib:/src/lib -v ${CURRETN_PATH}/docker-exchange/usr/games:/usr/games -v ${CURRETN_PATH}/ros-entery/projectinterface:/entry --name myinterface rosbase/${ARCHITECTUR}:${ROSVERSION}
#docker run -d --restart always -p 8002:8002 -p 8001:8001 -p 8000:8000 -p 4210:4210 -v ${CURRETN_PATH

#docker create -v ${CURRETN_PATH}/docker-exchange/src:/src -v ${CURRETN_PATH}/docker-exchange/lib:/src/lib -v ${CURRETN_PATH}/docker-exchange/usr/games:/usr/games ${CURRETN_PATH}/ros-entery/projecttriangulation:/entry --name mytriangulation rosbase/${ARCHITECTUR}:${ROSVERSION}


unset ARCHITECTUR
unset ROSVERSION

