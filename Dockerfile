FROM ubuntu:latest
MAINTAINER twjitm "twjitm@gmail.com"
RUN apt-get update
CMD ['/usr/sbin/init']
