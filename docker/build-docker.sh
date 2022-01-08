#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-coinrac/coinracd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/coinracd docker/bin/
cp $BUILD_DIR/src/coinrac-cli docker/bin/
cp $BUILD_DIR/src/coinrac-tx docker/bin/
strip docker/bin/coinracd
strip docker/bin/coinrac-cli
strip docker/bin/coinrac-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
