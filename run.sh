docker stop roscore
docker stop devshell
docker stop rvizweb

docker pull sausy/roscore:amd64_melodic
docker pull sausy/devshell:amd64
docker pull sausy/rvizweb:melodic

cd ProjektDefault/rosDevBash/.
./start.sh

cd ../../ProjektRosCore/.
./start.sh

cd ../ProjektWevRviz/.
./run.sh

docker ps -a
