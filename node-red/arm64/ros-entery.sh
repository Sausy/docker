#/bin/bash
export ROS_MASTER_URI=http://localhost:11311
export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})
source /opt/ros/melodic/setup.bash

roscore & sleep 5 && \
roslaunch rosbridge_server rosbridge_websocket.launch & sleep 4 && \
rosrun tf2_web_republisher tf2_web_republisher
