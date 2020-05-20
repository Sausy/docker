mkdir -p docker-exchange/.node-red
mkdir -p docker-exchange/controll

git clone https://github.com/sausy/node-red-contrib-web-babylonjs.git

#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

docker rm -f mynodered > /dev/null
docker rm -f myroscore > /dev/null

docker-compose build

#=== parameterisize it =====
echo "======================="
echo "build done"
echo "======================="
CURRETN_PATH=$(pwd)
echo ${CURRETN_PATH}/docker-exchange/.node-red:/data
#docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:1.0.6-12-minimal-arm64v8
docker create -p 1880:1880 -p 9099:9099 --name mynodered -v ${CURRETN_PATH}/docker-exchange/.node-red:/data -v ${CURRETN_PATH}/docker-exchange/controll:/controll nodered/node-red:x64
docker create -p 11311:11311 -p 9090:9090 --name myroscore roscore/x64:melodic

docker start mynodered

state_last=NULL

while :
do
  state_current=$( cat $CURRETN_PATH/docker-exchange/controll/roscore )
  if [ $state_last != $state_current ]
    then
      state_last=$state_current
      if [ $state_current == 'false' ]
        then
        echo "kill roscore"
        #docker exec -it myroscore killall roslaunch
        docker stop myroscore
        else
        docker start myroscore

      fi
  fi

	sleep 3
done
