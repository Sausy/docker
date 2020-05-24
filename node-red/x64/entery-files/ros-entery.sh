#/bin/bash
echo "" > /root/.ros/log/latest/master.log

roscore &
sleep 3
#cat /root/.ros/log/latest

for (( c=1; c<=30; c++ ))
do
#   cat /root/.ros/log/latest
   foo=$(cat /root/.ros/log/latest/master.log | grep 'server binding')
   echo "${foo}"
   if [ "${foo}" != "" ]
   then
      echo "======[ROS-CORE started]======="
      break
   fi
   sleep 1
done

roslaunch rosbridge_server rosbridge_websocket.launch & sleep 10
rosrun tf2_web_republisher tf2_web_republisher

#roslaunch rosbridge_server rosbridge_websocket.launch & sleep 4 && \
#rosrun tf2_web_republisher tf2_web_republisher

