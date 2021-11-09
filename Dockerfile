FROM ubuntu:latest
MAINTAINER twjitm "twjitm@gmail.com"
COPY packages/jdk-8-linux-x64.tar.gz /root/
RUN apt-get update &&\
    mkdir -p /usr/lib/java &&\
    tar -zxvf /root/jdk-8-linux-x64.tar.gz -C /usr/lib/java



ENV JAVA_HOME=/usr/lib/java/jdk1.8.0
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

CMD ["/bin/bash"]