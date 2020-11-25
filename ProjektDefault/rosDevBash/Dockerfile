ARG PLATFORM
ARG ROS_DIST
FROM --platform=linux/$PLATFORM ubuntu:bionic

ARG ROS_DIST

RUN apt-get update && \
    apt-get upgrade -y && \
    echo "#===========[tzdata-no interactive]=============" && \
    export DEBIAN_FRONTEND=nointeractive && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractie tzdata && \
    apt-get install -y git nano curl sudo man wget && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash userdev && \
    echo "userdev:ubuntu" | chpasswd && \
    adduser userdev sudo && \
    echo "userdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /data && \
    apt-get update && \
    apt-get install -y \
    lsb-release \
    gnupg2 && \
    apt-get install -y \
    python-pip \
    python-dev && \
    mkdir /entry && \
    mkdir /custom && \
    mkdir /custom/src && \
    mkdir /custom/lib

RUN echo "===========[build-essential]=============" && \
    apt-get install -y --ignore-missing \
    build-essential \
    git && \
    echo "===========[cmake Fix]=============" && \
    apt-get remove -y cmake && \
    apt-get install -y --ignore-missing \
    libssl-dev \
    libffi-dev && \
    su userdev && \
    cd /home/userdev/. && \
    git clone https://github.com/Kitware/CMake && \
    cd CMake && \
    ./bootstrap && \
    make -j$(nproc)
RUN cd /home/userdev/CMake && \
    make install

RUN echo "===========[ROS]=============" && \
    echo "source /opt/ros/${ROS_DIST}/setup.bash" >> /home/userdev/.bashrc && \
    apt-get install -y --ignore-missing \
    libffi-dev \
    libyaml-cpp-dev \
    libboost-all-dev \
    libalglib-dev && \
    apt-get install -y --ignore-missing \
    python-twisted \
    python-cffi && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update && \
    apt-get install -y --ignore-missing \
    ros-${ROS_DIST}-desktop-full
RUN apt-get install -y --ignore-missing \
    ros-${ROS_DIST}-robot-localization \
    ros-${ROS_DIST}-pcl-ros \
    ros-${ROS_DIST}-gazebo-ros && \
    apt-get install -y --ignore-missing \
    ros-${ROS_DIST}-angles \
    ros-${ROS_DIST}-interactive-markers \
    ros-${ROS_DIST}-tf-conversions && \
    apt-get install -y --ignore-missing \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    libssl-dev \
    libffi-dev && \
    apt-get install -y --ignore-missing \
    python-autobahn \
    python-cffi \
    python-bson \
    python-twisted && \
    pip install twisted bson cffi && \
    pip install tornado pyOpenSSL && \
    pip install pymongo && \
    pip install autobahn

RUN cd /home/userdev/. && \
    mkdir opencv && \
    echo "===========[OPENCV]=============" && \
    chown userdev:userdev opencv && \
    cd opencv && \
    su userdev && \
    git clone https://github.com/opencv/opencv.git && \
    git clone https://github.com/opencv/opencv_contrib.git && \
    mkdir build && cd build && \
    cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ../opencv && \
    make -j$(nproc)
RUN cd /home/userdev/opencv/build && \
    make install


CMD bash -C '/entry/entry.sh';'bash'
