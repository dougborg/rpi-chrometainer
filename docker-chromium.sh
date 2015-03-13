#!/bin/bash

XSOCK=/tmp/.X11-unix
export DISPLAY=unix:0

CONTAINER=dougborg/rpi-chromium-entry
COMMAND=chromium
IMAGE_NAME=chromium

sudo xhost +

docker run --rm \
	-v ${XSOCK}:${XSOCK}\
	-e DISPLAY=${DISPLAY}\
        --privileged=true\
        --name ${IMAGE_NAME}\
        ${CONTAINER} --app=http://dashboard.e.ecovate.com/ci
