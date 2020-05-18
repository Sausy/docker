FROM nodered/node-red:latest

RUN npm i babylonjs && \
    npm install node-red-contrib-web-babylonjs && \
    npm install node-red-dashboard && \
    npm install node-red-contrib-ros
    #chmod +x setup.sh && \
    #ln -s /usr/src/node-red/node_modules/ /data/node_modules

COPY --chown=node-red node-red-contrib-web-babylonjs /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/.
