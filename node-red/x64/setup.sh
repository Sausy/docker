mkdir -p docker-exchange/.node-red
mkdir -p docker-exchange/controll

git clone https://github.com/sausy/node-red-contrib-web-babylonjs.git

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes
