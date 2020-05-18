graphicnodered_arm64:
  image: nodered/node-red:arm64
  build:
    context: .
    dockerfile: Dockerfile_arm64
  volumes:
    - /home/$USER/.node-red:/data
  ports:
    - "1880:1880"
    - "9099:9099"
