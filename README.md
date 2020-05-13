# docker
custom docker stuff


sudo apt-get update
sudo apt-get remove docker docker-engine docker.io

sudo apt install qemu qemu-user-static binfmt-support docker.io

cat pw.txt | sudo docker login --username sausy --password-stdin

sudo groupadd docker
#sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker
sudo chown sausy:docker ~/.docker


to use buildx
nano ~/.docker/config.json

{
        "auths": {
                "https://index.docker.io/v1/": {
                        "auth": "c2F1c3k6U2F1c2krMzIxXw=="
                }
        },
        "HttpHeaders": {
                "User-Agent": "Docker-Client/18.09.7 (linux)"
        },
        "experimental": true

}



sudo service docker restart

to run on different architecture
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes

if
docker buildx ls
doesn't work just go into
sudo service docker stop
sudo dockerd --experimental

which should display alle the supportet architectures
to use a specific architecture

docker run --rm ubuntu:18.04@sha256:214d66c966334f0223b036c1e56d9794bc18b71dd20d90abb28d838a5e7fe7f1 uname -m

if you don't want to log out and log in again use the hacky way
su - $USER

#sudo apt-get install apt-transport-https ca-certificates curl software-properties-common


## Usefull Comands
```
sudo docker commit d32b2a73140 x64/ros2/dashing:latest
```
