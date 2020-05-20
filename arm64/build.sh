export $(cat .env | awk 'NR == 1')
export $(cat .env | awk 'NR == 2')

CURRETN_PATH=$(pwd)
echo "======================="
echo "build done"
echo "ARCHITECTUR: $ARCHITECTUR"
echo "ROS-Version: $ROSVERSION"
echo "current Path $CURRETN_PATH"
echo "........................"
echo "TIP: to change these vars"
echo "edit the '.env' file"
echo "======================="

mkdir -p docker-exchange/controll

git clone https://github.com/Sausy/node-red-contrib-web-babylonjs.git

#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

docker rm -f bionic_ros > /dev/null

docker-compose build

#docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:1.0.6-12-minimal-arm64v8
docker create -v /home/$USER/Projects:/home/userdev/Projects --name bionic_ros bionic/${ARCHITECTUR}:${ROSVERSION} /bin/bash
docker start bionic_ros

#To acually run the dev enviroment 
docker exec -it bionic_ros /bin/bash

unset ARCHITECTUR
unset ROSVERSION
