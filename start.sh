#!/usr/bom/env bash
echo 'start run  docker'
ip='127.0.0.1'

docker run -m 2g -it -d --privileged -p 2222:22 -v //Users/toufumie/twjitm/twjitm-game/:/data/code/twjitm-game/ twjitm:test /usr/sbin/init >maintainer.pid
pid=$(cat maintainer.pid)
echo $pid

echo 'success ful'
