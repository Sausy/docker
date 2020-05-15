FROM nodered/node-red:latest

#ADD /home/sausy/.node-red /data

#COPY --chown=node-red setup.sh /usr/src/node-red/.

RUN npm i babylonjs && \
    npm install node-red-contrib-web-babylonjs && \
    #chmod +x setup.sh && \
    ln -s /usr/src/node-red/node_modules/ /data/node_modules

#COPY --chown=node-red index.html /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/scene-ui/index.html
COPY --chown=node-red node-red-contrib-web-babylonjs /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/.





    #mkdir -p /data/custom/modules && \
    #cp /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/box.js /data/custom/modules/custom.js && \


#  Add the following to .config.json
#
#    "box": {
#     "name": "box",
#     "types": [
#      "box"
#     ],
#     "enabled": true,
#     "local": false,
#     "module": "node-red-contrib-web-babylonjs",
#     "file": "/usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/box.js"
#    },
