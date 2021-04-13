ARCHITECTUR=arm64
ROSVERSION=melodic
DOCKHUB_USER=sausy
PROJECT_NAME=roscore

read -p "whats the target Architecture arm64/amd64/.." ARCHITECTUR
read -p "whats the target ROSVERSION melodic/noetic/.. " ROSVERSION
read -p "whats the target DOCKHUB User maxmusterman " DOCKHUB_USER
read -p "whats the target Project Name roscore " PROJECT_NAME

echo "ARCHITECTUR=${ARCHITECTUR}
ROSVERSION=${ROSVERSION}
DOCKHUB_USER=${DOCKHUB_USER}
PROJECT_NAME=${PROJECT_NAME}" >> ./.env

#-----[to ensure everything is up to date]----
git submodule init
git submodule update

find . -maxdepth 1 -type d -exec cp .env {} \;
