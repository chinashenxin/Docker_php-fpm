FROM centos
MAINTAINER NGINX Docker Maintainers "814787730@qq.com"
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN rpm -Uvh http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
RUN yum install -y php70w-devel php70w.x86_64 php70w-pecl-redis  php70w-cli.x86_64 php70w-common.x86_64 php70w-gd.x86_64 php70w-ldap.x86_64 php70w-mbstring.x86_64 php70w-mcrypt.x86_64  php70w-pdo.x86_64   php70w-mysqlnd  php70w-fpm php70w-opcach


RUN perl -p -i -e "s/daemonize = yes/daemonize = no/g" /etc/php-fpm.conf 

RUN perl -p -i -e "s/listen.allowed_clients = 127.0.0.1/;listen.allowed_clients = 127.0.0.1/g" /etc/php-fpm.d/www.conf
RUN echo -e  "[global]\ndaemonize = no\n[www]\nclear_env = no\ncatch_workers_output = yes\nlisten = [::]:9000 ">/etc/php-fpm.d/zdocker.conf;
RUN mkdir -p /nginx/www
EXPOSE 9000
CMD ["php-fpm"]
aaaaaaaaaaaa


