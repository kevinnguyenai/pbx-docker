#!/bin/bash
PLATFORM=$1
VER=$2
TOKEN=$3

if [[ -z $1 ]]; then
    PLATFORM=linux/arm/v7,linux/amd64
fi

if [[ -z $2 ]]; then
    VER=latest
fi

if [[ -z $3 ]]; then
    echo "Please enter freeswitch resource token"
    exit 0
fi

pushd freeswitch
docker buildx build --platform ${PLATFORM} \
 --build-arg=FS_TOKEN=${TOKEN} \
 --push -t fgst/fen-freeswitch:${VER} .
popd