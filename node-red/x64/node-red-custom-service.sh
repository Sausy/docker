docker start mynodered
state_last='false'

CURRETN_PATH=$(pwd)

echo $( cat $CURRETN_PATH/docker-exchange/controll/roscore )

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
