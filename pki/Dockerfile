FROM twjitm:8.0
MAINTAINER twjitm "twjitm@gmail.com"

COPY nginx/dcat.conf /etc/nginx/conf.d/
COPY conf/ /conf/
COPY init_v1.sh /conf/

ENV LANG en_US.utf8
ENV USER_HOME root \
ENV JAVA_HOME /usr/lib/java/jdk1.8.0
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

RUN set -x \
    && yum -y install java-1.8.0-openjdk

CMD ["/bin/bash"]