# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:dashing-ros-core-bionic
# install ros2 packages
RUN apt-get update && apt-get install -y \
    ros-dashing-ros-base=0.7.3-1* \
    && rm -rf /var/lib/apt/lists/*

#====== basic setup =====
#....this includes adding a user called "userdev:ubuntu" which is part of sudo
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y git nano curl sudo man wget && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash userdev && \
    echo "userdev:ubuntu" | chpasswd && \
    adduser userdev sudo && \
    echo "userdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER userdev
WORKDIR /home/userdev

RUN echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc && \
    mkdir -p ~/project/ros2_test/src && \
    git clone https://github.com/ros2/examples.git && \
    cp -r ~/examples/rclcpp/topics ~/project/ros2_test/src/.
