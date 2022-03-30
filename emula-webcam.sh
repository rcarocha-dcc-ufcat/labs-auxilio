#!/bin/sh

IDWEBCAM=`ls -1 /sys/devices/virtual/video4linux`

cd ~/lab-webrtc
ffmpeg -stream_loop -1 -re -i synctest-h264.mp4 -vcodec rawvideo -threads 0 -f v4l2 /dev/$IDWEBCAM
