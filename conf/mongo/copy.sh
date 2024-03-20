#!/usr/bin/env bash
sed -i 's#keepcache=0#keepcache=1#g' /etc/yum.conf
cd /var/cache/yum/x86_64/7
rm -rf mongodb-org-4.2/
unzip mongodb-org-4.2.zip
yum -C -y install mongodb-org
echo 'install mongodb done'
