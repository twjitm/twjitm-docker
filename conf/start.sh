#! /bin/sh

nohup /usr/bin/supervisord -n -c /etc/supervisord.conf > /dev/null 2>&1 &

