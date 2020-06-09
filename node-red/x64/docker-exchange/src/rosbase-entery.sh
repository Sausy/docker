#/bin/bash
#roscore & sleep 4 && \
#roslaunch rosbridge_server rosbridge_websocket.launch & sleep 4 && \
#rosrun tf2_web_republisher tf2_web_republisher
export ROS_MASTER_URI=http://192.168.1.1:11311
source /opt/ros/melodic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/src/lib

/src/roboy_lighthouse2

