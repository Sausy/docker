echo "example usage: ./build arm64 melodic"
echo ""
echo ""
echo "======[ ARCHITECTURE ] ========"
if [ $# -lt 1 ]
then
	ARCHITECTUR="arm64"
	echo "no ARCHITECTUR set"
	echo "...seting to default"
	echo "ARCHITECTUR: ${ARCHITECTUR}"
else
        ARCHITECTUR=$1
	echo "...seting [${ARCHITECTUR}]"
case "$ARCHITECTUR" in
   "x64")   ARCHITECTUR=amd64 ;;
   "amd")   ARCHITECTUR=amd64 ;;
   "amd32") echo "amd32 Dafuq assuming i386"
            ARCHITECTUR=386 ;;
   "i386")  ARCHITECTUR=386 ;;
   "x86")   ARCHITECTUR=386 ;;
   "x86_64")   ARCHITECTUR=386 ;;
   "aarch64")   ARCHITECTUR=amd64 ;;
esac
        echo "ARCHITECTUR: ${ARCHITECTUR}"
fi
echo "======================="

echo "======[ ROS Version ] ========"
if [ $# -lt 2 ]
then
        echo "no ROS-Version set"
        echo "...seting to default"
        echo "ROS-Version: melodic"
	#$2='melodic'
	ROSVERSION=melodic
else
        echo "...seting"
        echo "ROS-Version: ${2}"
	ROSVERSION=$2
fi
echo "======================="

echo "ARCHITECTUR=$ARCHITECTUR
ROSVERSION=$ROSVERSION
USER_NAME=userdev" > '.env'


echo "[INFO] starting multiarch docker do allow multi platforms"
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

#export $(cat .env | awk 'NR == 1')
#export $(cat .env | awk 'NR == 2')

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

mkdir -p docker-exchange

#git clone https://github.com/Sausy/node-red-contrib-web-babylonjs.git
#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes
#docker rm -f bionic_ros > /dev/null

docker-compose build
docker-compose up --no-start

#docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:1.0.6-12-minimal-arm64v8
#docker create -v /home/$USER/Projects:/home/userdev/Projects --name bionic_ros bionic/${ARCHITECTUR}:${ROSVERSION} /bin/bash
#docker start bionic_ros
#To acually run the dev enviroment 
#docker exec -it bionic_ros /bin/bash

unset ARCHITECTUR
unset ROSVERSION
