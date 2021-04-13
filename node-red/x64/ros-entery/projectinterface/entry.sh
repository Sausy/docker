#/bin/bash
#roscore & sleep 4 && \
#roslaunch rosbridge_server rosbridge_websocket.launch & sleep 4 && \
#rosrun tf2_web_republisher tf2_web_republisher
#export ROS_MASTER_URI=http://192.168.1.1:11311
#DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
#export ROS_MASTER_URI=http://${DEFAULT_ROUTE}:11311
export ROS_MASTER_URI=http://10.10.0.2:11311
export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})

source /opt/ros/melodic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/src/lib

/src/roboy_lighthouse2
