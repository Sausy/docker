FROM rpiarm64ros2:latest

RUN export CHOOSE_ROS_DISTRO=melodic && \
    sudo apt install -y ros-$CHOOSE_ROS_DISTRO-ros-base && \
    sudo apt install python3-argcomplete python3-colcon-common-extensions ros-$CHOOSE_ROS_DISTRO-moveit && \
    echo "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash && \
    export CMAKE_PREFIX_PATH=$AMENT_PREFIX_PATH

#==== INSTALL NANO PB ====
RUN pip3 install conan_package_tools protobuf && \
    sudo apt install libprotobuf-dev protobuf-compiler
    git clone https://github.com/nanopb/nanopb.git && \
    cd nanopb && \
    sudo chmod -R +x ../generator/* && \
    mkdir build && \
    cd build && \
    cmake ../. && \
    make

# i faced an error with colcon build and non pb
# could not find proto ....
# to fix it change in the given file that comes after this msg in my case  /home/userdev/Projects/lighthouse/lighthouse2sandbox/sandbankros2/build/sub/nanopb/generator/nanopb_generator.py
# /bin/bash python to /bin/bash python3

#should also be fixed in nanopb git repo ... this shit still runs on python3

#Fix for compile libs
# mkdir ~/lib
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/lib
# scp install/*_msgs/lib/*.so ubuntu@192.168.0.36:~/lib/.



CMD ["uname -a"]
