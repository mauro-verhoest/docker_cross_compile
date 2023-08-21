#https://project-chip.github.io/connectedhomeip-doc/guides/BUILDING.html
#https://askubuntu.com/questions/707621/official-docker-image-for-ubuntu-server
FROM arm64v8/ubuntu:latest
MAINTAINER "Mauro Verhoest"
ENV DEBIAN_FRONTEND noninteractive
#https://betterstack.com/community/questions/how-to-use-sudo-inside-docker-container/
RUN apt-get update && apt-get install -y ubuntu-server git sudo



#install prerequisties Linux 
RUN apt-get  install -y git gcc g++ pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev
#install prerequisties rpi4 
RUN apt-get  install -y pi-bluetooth avahi-utils


#Set working directory
WORKDIR /home/connectedhomeip