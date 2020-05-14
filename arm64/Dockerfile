FROM --platform=linux/arm64 ubuntu:18.04

#====== basic setup =====
#....this includes adding a user called "userdev:ubuntu" which is part of sudo
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y git nano curl sudo man wget unzip tar gnupg2 lsb-release lsb-core && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq tzdata && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash userdev && \
    echo "userdev:ubuntu" | chpasswd && \
    adduser userdev sudo && \
    echo "userdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    groupadd gpio && \
    adduser userdev gpio

#====== install dev package =====
#    pip install --upgrade pip && \
RUN apt install -y vim lsb-release build-essential autoconf libtool cmake pkg-config && \
    apt install -y python3-dev python3 python3-pip && \
    pip3 install --user --upgrade pip

USER userdev
WORKDIR /home/userdev


#====== INSTALL wiringPi ====
RUN pip3 install wiringpi && \
    pip3 install -U pip setuptools && \
    pip3 install libusb1 enum34 psutil

#====== PRE INSTALL ROS 2 ====
RUN sudo apt update && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    sudo apt update

#====== PRE INSTALL ROS 1 ====
RUN sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    sudo apt update 

CMD ["uname -a"]
