#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io
sudo systemctl enable --now docker

clear
docker --version
clear

touch Dockerfile
# Start PulseAudio server
pulseaudio -D --exit-idle-time=-1

# Create virtual sound devices
pacmd load-module module-virtual-sink sink_name=v1
pacmd set-default-sink v1
pacmd set-default-source v1.monitor

# Start Xfce desktop
startxfce4 &

# Start VNC server
x11vnc -display :0 -nopw -forever -xkb -bg -rfbport 5900 -localhost -o /tmp/x11vnc.log &

# Start NoVNC
websockify --web /usr/share/novnc/ 8080 localhost:5900
