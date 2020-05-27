ARG PLATFORM
FROM --platform=linux/$PLATFORM ubuntu:18.04
#INFO cd only affects the current RUN after the RUN cmd ends it will jump back to WorkDIR
ARG PLATFORM
ARG DOCKER_VAR_ROS_DISTRO
ARG USER_NAME

#====== basic setup =====
#....this includes adding a user called "userdev:ubuntu" which is part of sudo
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git nano curl sudo man wget unzip tar gnupg2 lsb-release \
    lsb-core \ 
    sed \
    libncurses5-dev && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq tzdata && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash $USER_NAME && \
    echo "$USER_NAME:ubuntu" | chpasswd && \
    adduser $USER_NAME sudo && \
    echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    groupadd gpio && \
    adduser $USER_NAME gpio &&\
#====== install dev package ===== && \
#    pip install --upgrade pip && \
    apt install -y vim lsb-release build-essential autoconf libtool cmake pkg-config && \
    apt install -y python3-dev python3 python3-pip && \
    pip3 install --user --upgrade pip

USER $USER_NAME
WORKDIR /home/$USER_NAME

#====== INSTALL wiringPi ====
RUN pip3 install wiringpi && \
    pip3 install -U pip setuptools && \
    pip3 install libusb1 enum34 psutil && \
#====== OpenCV ==== && \
    sudo apt-get install -y python3-opencv && \
    #mkdir ~/opencv_build && cd ~/opencv_build && \
    #git clone https://github.com/opencv/opencv.git && \
    #git clone https://github.com/opencv/opencv_contrib.git && \
    #cd /home/userdev/opencv_build/opencv && \
    #mkdir build && cd build && \
    #cmake -D CMAKE_BUILD_TYPE=RELEASE \
    #-D CMAKE_INSTALL_PREFIX=/usr/local \
    #-D INSTALL_C_EXAMPLES=ON \
    #-D INSTALL_PYTHON_EXAMPLES=ON \
    #-D OPENCV_GENERATE_PKGCONFIG=ON \
    #-D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    #-D BUILD_EXAMPLES=ON .. && \
    #make && \
    #sudo make install && \
    #cd /home/$USER_NAME
#====== PRE INSTALL ROS 2 ==== && \
    #sudo apt update && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    sudo apt update && \
#====== PRE INSTALL ROS 1 ==== && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    sudo apt update

CMD [ "tail", "-f" "/dev/null" ]
