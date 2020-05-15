#mkdir -p /data/test

cat index.html > /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/scene-ui/index.html


#FILE_NAME=/data/.config.json && \
#cat $FILE_NAME && \
#ADD_ENTRY_STRING='  "coord_obj": { \
    #"name": "coord_obj", \
    #"types": [ \
      #"coord_obj" \
      #], \
      #"enabled": true, \
      #"local": false, \
      #"module": "node-red-contrib-web-babylonjs", \
      #"file": "/usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/coord_obj.js" \
      #}, ' && \
#sed "/\"box\": {/i${ADD_ENTRY_STRING}" $FILE_NAME > "${FILE_NAME}_temp" && cat "${FILE_NAME}_temp" > $FILE_NAME

#cp /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/box.js /usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/coord_obj.js


#/usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/package.json
#ADD_ENTRY_STRING='"coord_obj": "box.js",' && \
#FILE_NAME=/usr/src/node-red/node_modules/node-red-contrib-web-babylonjs/package.json && \
#cat $FILE_NAME && \
#echo $ADD_ENTRY_STRING && \
#sed "/\"transform\":/\"transform.js\"/i${ADD_ENTRY_STRING}" $FILE_NAME > "${FILE_NAME}_temp" && cat "${FILE_NAME}_temp" > $FILE_NAME

#/usr/local/bin/
