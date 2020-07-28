# HowTo Autostart
In following examples the username is "ubuntu"

## PreInfo
```
sudo systemctl daemon-reload
sudo systemctl enable name1.name2.service
```

## Autostart Service

```
sudo nano /etc/systemd/system/name1.name2.service
```
With the following content
```
[Unit]
Description=LighthouseInterface Service
After=docker.service
Requires=docker.service

[Service]
Type=forking
User=ubuntu
ExecStart=/bin/sh -c ". /opt/ros/melodic/setup.sh; . /etc/ros/env.sh; /home/ubuntu/roboy_lighthouse2 &"

[Install]
WantedBy=multi-user.target

```

## Environment var
If a service needs certain vaules like a RosProgamm add the following file
```
sudo mkdir /etc/nameofproject
sudo nano /etc/nameofproject/env.sh
```
with the following stuff
```
#!/bin/sh

export ROS_MASTER_URI=http://192.168.1.1:11311
export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/src/lib
```


## container Service (after networkboot)
```
sudo nano /etc/systemd/system/docker.roscore.service
```
```
[Unit]
Description=Roscore Container
After=NetworkManager.service time-sync.target
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker exec %n stop
ExecStartPre=-/usr/bin/docker rm %n
ExecStart=/usr/bin/docker run --rm --name %n \
-p 9090:9090
-p 11311:11311
roscore/arm64:melodic

[Install]
WantedBy=default.target
```

To ensure a proper startup the container first has to be stoped and removed
to properly startup.
(P.S.: =- tells the system to not but the output into the log)

