
echo "====[Start build/create docker Stuff] ====="
export $(cat .env | awk 'NR == 1')
export $(cat .env | awk 'NR == 2')
#=== parameterisize it =====
echo "======================="
echo "build done"
echo "ARCHITECTUR: $ARCHITECTUR"
echo "ROS-Version: $ROSVERSION"
echo "........................"
echo "TIP: to change these vars"
echo "edit the '.env' file"
echo "======================="

find . -maxdepth 1 -type d -exec cp .env {} \;

#-----[to ensure everything is up to date]----
git submodule init
git submodule update

#------------------------------------
#TODO: create a roboy docker hub account
postFix="${ARCHITECTUR}_${ROSVERSION}"
DOCKER_HUB_NAME_0="sausy/roscore:${postFix}"
DOCKER_HUB_NAME_1="sausy/rosbase:${postFix}"
#-------------------------------------

echo "======================="
echo $DOCKER_HUB_NAME_0

echo "==========[ROSCORE]============="
fallBack=0
read -p "Use prebuild container [Y/n]" -n 1 -r
if [[ ! $REPLY =~ ^[Nn]$ ]]
 then

 docker pull $DOCKER_HUB_NAME_0 || fallBack=1
 if [[ $fallBack -eq 1 ]]; then
  echo "[ERROR] THIS COINTAINER DOESN'T EXIST"
  echo "[INFO] Container will be rebuilt"
 else
  docker tag $DOCKER_HUB_NAME roscore/${ARCHITECTUR}:${ROSVERSION}
 fi
else
 fallBack=1
fi

if [[ fallBack -eq 1 ]]
then
 #-----[create roscore & rosbridge docker]-----
 echo "build roscore and rosbridge docker"
 cd docker_ros
 ./build.sh
fi
