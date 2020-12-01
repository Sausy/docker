sudo apt-get update
sudo apt-get upgrade -y

echo "#===========[tzdata-no interactive]============="
export DEBIAN_FRONTEND=nointeractive
ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
sudo apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractie tzdata
sudo apt-get install -y git nano curl sudo man wget


#mkdir /data
sudo apt-get update
sudo apt-get install -y lsb-release gnupg2
sudo apt-get install -y \
python-pip \
python-dev

#mkdir /entry
#mkdir /custom
#mkdir /custom/src
#mkdir /custom/lib

echo "===========[build-essential]============="
sudo apt-get install -y --ignore-missing \
    build-essential \
    git

echo "===========[cmake Fix]============="
sudo apt-get remove -y cmake
sudo apt-get install -y --ignore-missing \
    libssl-dev \
    libffi-dev

cd ~/.

git clone https://github.com/Kitware/CMake
cd CMake
./bootstrap
make -j$(nproc)
cd ~/CMake
sudo make install

echo "===========[ROS]============="
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
sudo apt-get install -y --ignore-missing \
libffi-dev \
libyaml-cpp-dev \
libboost-all-dev \
libalglib-dev
sudo apt-get install -y --ignore-missing \
python-twisted \
python-cffi

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update
sudo apt-get install -y --ignore-missing ros-melodic-desktop-full
sudo apt-get install -y --ignore-missing \
ros-melodic-robot-localization \
ros-melodic-pcl-ros \
ros-melodic-gazebo-ros

sudo apt-get install -y --ignore-missing \
ros-melodic-angles \
ros-melodic-interactive-markers \
ros-melodic-tf-conversions

sudo apt-get install -y --ignore-missing \
python-rosdep \
python-rosinstall \
python-rosinstall-generator \
python-wstool \
libssl-dev \
libffi-dev

sudo apt-get install -y --ignore-missing \
python-autobahn \
python-cffi \
python-bson \
python-twisted

pip install twisted bson cffi
pip install tornado pyOpenSSL
pip install pymongo
pip install autobahn

cd ~/.

mkdir opencv
echo "===========[OPENCV]============="
cd opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
mkdir build && cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ../opencv
make -j$(nproc)
cd ~/opencv/build
sudo make install
