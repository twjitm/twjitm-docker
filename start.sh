#!/sh/bash
echo 'start run  docker'
PORT=$1
mkdir -p "${PORT}"
cp -rf cmd.sh "${PORT}"
cd "${PORT}"

WEB_PORT=$((9100 + ${PORT}))
FTP_PORT=$((9200 + ${PORT}))
MONGO_PORT=$((17017 + ${PORT}))

IMAGES=twjitm/twjitm:8.1 
docker run -m 2g -it -d --privileged --name 'admin_gm_'${PORT} -p "${MONGO_PORT}":27017 -p "${WEB_PORT}":8080 -p "${FTP_PORT}":22 ${IMAGES} /bin/sh >maintainer.pid
pid=$(cat maintainer.pid)
echo $pid

echo 'success ful'

