FROM bionic/arm64:latest

RUN export CHOOSE_ROS_DISTRO=dashing && \
    sudo apt install -y ros-$CHOOSE_ROS_DISTRO-ros-base && \
    sudo apt install python3-argcomplete python3-colcon-common-extensions && \
    echo "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" >> ~/.bashrc

CMD ["uname -a"]
