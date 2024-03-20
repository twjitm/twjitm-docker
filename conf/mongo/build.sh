#!/usr/bin/env bash
cp /conf/mongo/mongodb42.repo /etc/yum.repos.d/mongodb42.repo
#离线模式安装mongodb
chmod 777 /conf/mongo/copy.sh
sh /conf/mongo/copy.sh
mkdir /data/db/
chown -R mongod:mongod /tmp/mongodb-27017.sock
nohup mongod & >>/data/logs/mongod_install.log
ret= netstat -nltp|grep mongo|wc -l
while [[ ${ret} -eq 0 ]]
do
    echo 'wait mongo db'
    sleep 1
    ret= netstat -nltp|grep mongo|wc -l
done
sleep 3

echo 'done'

