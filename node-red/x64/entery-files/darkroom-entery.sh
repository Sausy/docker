#/bin/bash
export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})
export ROS_MASTER_URI=http://192.168.1.1:11311

source /opt/ros/*/setup.bash

rostopic list
#exec darkroom
