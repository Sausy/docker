docker stop roscore
docker stop devshell
docker stop rvizweb

docker pull sausy/roscore:amd64_melodic
docker pull sausy/devshell:amd64
docker pull sausy/rvizweb:melodic

cd ProjektDefault/rosDevBash/.
./start.sh

cd ../../ProjektRosCore/.
./start.sh && \
echo "===[ROS Core startup]==" && \
echo "... this takes some time please wait" && \
sleep 30

cd ../ProjektWevRviz/.
./run.sh

docker ps -a
