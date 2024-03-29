FROM centos:7.8.2003
MAINTAINER twjitm "twjitm@gmail.com"
COPY conf /conf
COPY conf/supervisord.d /etc/supervisord.d
COPY conf/mysql/mysql-community.repo /etc/yum.repos.d/
COPY conf/mysql/my.cnf /conf

#yum install -y epel-release yum-utils
#yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
#yum-config-manager --enable remi-php81
#yum install -y php php-common php-opcache php-cli php-curl php-pecl-igbinary php-pecl-redis5 php-pecl-swoole php-pecl-apcu php-fpm php-mcrypt php-mbstring php-gd php-pecl-xhprof php-json php-pecl-imagick php-xml php-pecl-zip php-pecl-yaml php-fpm php-pecl-swoole php-bcmath
#yum install -y nginx vim htop net-tools svn rsync sudo openssl openssh-server openssh-clients lrzsz fish dnf crontabs dstat wget

RUN set -x \
    && mkdir -p /mnt/logs/supervisor/ \
    && yum -y update \
    && yum install -y epel-release yum-utils \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php81 \
    && yum-config-manager --enable mysql80-community \
    && yum -y install --nogpgcheck \
    mysql-community-server -x Percona-Server-shared-56 \
    net-tools \
        wget \
        make \
        openssl-devel \
        git \
        curl \
        net-tools \
        crontabs \
        procps \
        unzip \
        python-pip \
        tree \
        nss \
        php \
        php-cli \
        php-fpm \
        php-mysqlnd \
        php-zip \
        php-zlib \
        php-devel \
        php-gd \
        php-mcrypt \
        php-mbstring \
        php-curl \
        php-xml \
        php-pear \
        php-bcmath \
        php-json \
        php-opcache \
        php-redis \
        php-mongodb \
        php-tidy \
        php-pecl-zip \
        php-pecl-runkit7 \
        composer \
        nginx \
        supervisor \
        mysql \
        redis \
        vim \
    && /bin/cp -rf /conf/my.cnf /etc/my.cnf \
    && /bin/cp -rf /conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && /bin/cp -rf /conf/nginx/fastcgi.conf /etc/nginx/fastcgi.conf \
    && /bin/cp -rf /conf/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf \
    && /bin/cp -rf /conf/php/www.conf /etc/php-fpm.d/www.conf \
    && /bin/cp -rf /conf/php/php.ini /etc/php.ini \
    && /bin/cp -rf /conf/start.sh / \
    && mkdir -p /run/php-fpm  && rm -rf /conf \
    && echo -e '<?php phpinfo(); ?>' > /usr/share/nginx/html/index.php \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && chown -R mysql:mysql /var/lib/mysql \
    && mysql_install_db

EXPOSE 80 443
CMD ["/start.sh"]
CMD ["/usr/bin/supervisord", "-n"]