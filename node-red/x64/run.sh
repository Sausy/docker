#source /opt/ros/melodic/setup.bash
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/${USER}/lib

#docker rm -f mynodered > /dev/null
#docker rm -f myroscore > /dev/null
docker stop mynodered
docker stop myroscore

#export $(cat .env | awk 'NR == 1')
#export $(cat .env | awk 'NR == 2')

export ARCHITECTUR=arm64
export ROSVERSION=melodic

#=== parameterisize it =====
echo "======================="
echo "pre setup done"
echo "ARCHITECTUR: $ARCHITECTUR"
echo "ROS-Version: $ROSVERSION"
echo "........................"
echo "TIP: to change these vars"
echo "edit the '.env' file"
echo "======================="
#CURRETN_PATH=$(pwd)
CURRETN_PATH=/home/${USER}//docker/node-red/x64

unset ARCHITECTUR
unset ROSVERSION

docker start mynodered

state_last=NULL
state_last_int=NULL
state_last_int2=NULL

while :
do
  state_current=$( cat /home/${USER}/docker/node-red/x64/docker-exchange/controll/roscore )
  if [ $state_last != $state_current ]
    then
      state_last=$state_current
      if [ $state_current == 'false' ]
        then
        echo "kill roscore"
        docker stop myroscore
        docker stop myinterface
        else
        docker start myroscore
      fi
  fi

  state_current_int=$( cat /home/${USER}/docker/node-red/x64/docker-exchange/controll/tracker )
  if [ $state_last_int != $state_current_int ]
    then
      state_last_int=$state_current_int
      if [ $state_current_int == 'false' ]
        then
        echo "stop udp to ros bridge"
        docker stop myinterface
	echo "...done"
        else
        echo "starting udp to ros bridge"
        docker start myinterface
        echo "...done"
      fi
  fi

  state_current_int2=$( cat /home/${USER}/docker/node-red/x64/docker-exchange/controll/processing )
  if [ $state_last_int2 != $state_current_int2 ]
    then
      state_last_int2=$state_current_int2
      if [ $state_current_int2 == 'false' ]
        then
        echo "stoping triangulation process"
        docker stop mytriangulation
        echo "...done"
        else
	echo "starting triangulation process"
	docker start mytriangulation
        echo "...done"
      fi
  fi

	sleep 3
done
