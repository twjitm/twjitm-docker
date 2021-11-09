#!/sh/bash
echo 'start run  docker'
PORT=$1
WEB_PORT=$((1100 + ${PORT}))
FTP_PORT=$((1200 + ${PORT}))
MONGO_PORT=$((1300 + ${PORT}))

docker run -m 2g -it -d --privileged -p "${MONGO_PORT}":27017 -p "${WEB_PORT}":80 -p "${FTP_PORT}":22 twjitm:test /bin/sh >maintainer.pid
pid=$(cat maintainer.pid)
echo $pid

echo 'success ful'
