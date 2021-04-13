sudo cp node-red-custom-service.sh /usr/bin/.
sudo chmod +x /usr/bin/node-red-custom-service.sh

sudo echo "[Unit]
Description=node-red-custom-service.sh

[Service]
Type=forking
ExecStart=/usr/bin/node-red-custom-service.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/node-red-custom.service
