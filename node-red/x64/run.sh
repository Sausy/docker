source /opt/ros/melodic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/lib

docker rm -f mynodered > /dev/null
docker rm -f myroscore > /dev/null

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
	killall roboy_lighthouse2
        else
        docker start myroscore 
	#& sleep 30 && \
        #./roboy_lighthouse2

      fi
  fi

	sleep 3
done
