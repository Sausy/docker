# Quick start
pul it
```
docker pull nodered/node-red:1.0.6-12-minimal-arm64v8
mkdir -p ~/.node-red
```
run it
```
docker run -it -p 1880:1880 --name mynodered -v /home/$USER/.node-red:/data nodered/node-red:1.0.6-12-minimal-arm64v8
```
change it
```
docker exec -it mynodered /bin/bash
```


## Install 3D rendering
just got to local node-red interface and use the dialog in the right top corner to install
>>node-red-contrib-web-babylonjs

to try it out add e.g. an sphere
double click on the flow item and set
