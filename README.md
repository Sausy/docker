# docker
custom docker stuff

## POST INSTALL
```
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo chown $USER:docker ~/.docker

sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
### x86_x64
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

### arm64
```
sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## Instaltion
```
 sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
```

### Install qemu support
```
sudo apt install -y qemu qemu-user-static binfmt-support

```


## Log into docker online to acess the hub
cat pw.txt | sudo docker login --username sausy --password-stdin

## Build docker

### if experimental enabled
You could also specifiy the target architecture
FROM --platform=linux/arm64 ubuntu:18.04


## Run docker from differnt architecture
First you have to run
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes
```

example:
First build base arm img
```
cd arm64
docker build -t rpiarm64ros2:latest .
```
then build e.g. the one for meldoic (ros1)
```
cd melodic
docker build -t bionic/arm64:melodic .
```


## buildx (didn't work for me jet)
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

#Docker Compose
To build multiple targets and also predefine names ... docker-compose.yml could be used therefore a docker-compose.yml file
has to be created

```
version: ''
```
