#/bin/bash
roscore & sleep 4 && \
roslaunch rosbridge_server rosbridge_websocket.launch & sleep 4 && \
rosrun tf2_web_republisher tf2_web_republisher
