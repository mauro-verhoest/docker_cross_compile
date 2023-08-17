#https://project-chip.github.io/connectedhomeip-doc/guides/BUILDING.html
#https://askubuntu.com/questions/707621/official-docker-image-for-ubuntu-server
FROM arm64v8/ubuntu:latest
MAINTAINER "Mauro Verhoest"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server git 
#clone git repo 
#https://dzone.com/articles/clone-code-into-containers-how 
RUN mkdir connectedhomeip \
    cd /home/connectedhomeip\
    git clone --recurse-submodules git@github.com:project-chip/connectedhomeip.git 

#install prerequisties Linux 
RUN apt-get install git gcc g++ pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev
#install prerequisties rpi4 
RUN apt-get install pi-bluetooth avahi-utils

#prepare for builbing 
RUN source scripts/activate.sh

#build for the host OS 
RUN gn gen out/host
RUN ninja -C out/host
#Set working directory
WORKDIR /home/connectedhomeip