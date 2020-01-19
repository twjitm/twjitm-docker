#!/usr/bin/env bash
DOCKER_NUM=$1
pid=$(cat maintainer.pid)
docker stop ${pid}
docker rm -f ${pid}
rm -rf  maintainer.pid
cd ../
rm -rf ${DOCKER_NUM}
