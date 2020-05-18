# Quick start
pul it
```
docker pull nodered/node-red:1.0.6-12-minimal-arm64v8
mkdir -p ~/.node-red
```
run it
```
docker run -it -p 1880:1880 -p 9099:9099 --name mynodered -v /home/$USER/.node-red:/data nodered/node-red:1.0.6-12-minimal-arm64v8
```
change it
```
docker exec -it mynodered /bin/bash
```

## start Ros
to start ros (ps this description is straight forward and asumes nothing needs to be debuged)
```
docker create -p 11311:11311 --name myroscore roscore/x64:melodic
docker start myroscore
docker stop myroscore
```
note: with docker create -d is not necessary anymore

## Docker comunication
link one docker (roscore) to another (mynodered)
!!! PS don't use the link command ... its obsolete



### Silient
To run it in "silient" exchange "-it" with "-d"

### run depending docker in proper oder
??? there semes to be some kind of restard policy
Flag          |	Description
============================
no            |	Do not automatically restart the container. (the default)
on-failure	  | Restart the container if it exits due to an error, which manifests as a non-zero exit code.
always	      | Always restart the container if it stops. If it is manually stopped, it is restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in restart policy details)
unless-stopped |	Similar to always, except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts.

```
docker run -it --restart always -p 1880:1880 -p 9099:9099 --name mynodered -v /home/$USER/.node-red:/data nodered/node-red:1.0.6-12-minimal-arm64v8
```


### run on startup
Entry point should be handeld with a sript
and to runn it on startup



## Install 3D rendering
just got to local node-red interface and use the dialog in the right top corner to install
>>node-red-contrib-web-babylonjs

to try it out add e.g. an sphere
double click on the flow item and set
