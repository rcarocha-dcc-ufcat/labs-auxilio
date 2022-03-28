#!/bin/sh 

sudo apt update 
sudo apt install boxes
clear
# https://github.com/rcarocha-dcc-ufcat/labs-auxilio.git
echo "Demonstração de depuração/log de funcionamento do webRTC" | boxes -p h5v1
echo "Instalação do VLC e Chromium - tecle ENTER para continuar" | boxes -p h5v1
read R
#   - como visualizar
#   - como interpretar
sudo apt update
sudo apt install vlc
sudo apt install chromium-browser

echo "Emulacao de Webcam para uso no navegador com webRTC" | boxes -p h5v1
echo "Download de video exemplo e instalação de modulo do kernel - ENTER para continuar" | boxes -p h5v1
read R
cd ~
mkdir lab-webrtc
cd lab-webrtc
wget http://link.twitch.tv/synctest-h264
mv synctest-h264 synctest-h264.mp4

#   - download do video a ser utilizado: wget http://link.twitch.tv/synctest-h264
#   - instalação do serviço de webcam emulada
#    https://www.linuxfordevices.com/tutorials/linux/fake-webcam-streams
sudo apt install v4l2loopback-dkms
sudo apt install ffmpeg
sudo modprobe v4l2loopback card_label="Falsa Webcam" exclusive_caps=1

# detalhes de funcionamento 
#    https://github.com/umlaeute/v4l2loopback
#    ls -1 /sys/devices/virtual/video4linux
    
echo "Instação de ambiente de teste do WebRTC" | boxes -p h5v1
echo "Instalação do docker e do serviço - ENTER para continuar" | boxes -p h5v1
read R
#   - instalar o docker
sudo apt install docker.io
# - instalar o serviço de teste webRTC
cd ~/lab-webrtc
mkdir apprtc
cd apprtc
wget https://raw.githubusercontent.com/webrtc/apprtc/master/Dockerfile
cd ..
sudo docker build apprtc/
