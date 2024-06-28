FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xzvf  latest.tar.gz
RUN	cd /var/www/ && chown -R root:root wordpress
RUN apt-get install vim -y
COPY /conf/vimrc /etc/vim/vimrc
COPY /conf/php.ini /etc/php/7.4/cli/php.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp/
RUN cd /usr/local/bin/wp/ && chmod +x wp-cli.phar
COPY /conf/auto_config.sh   /var/www/wordpress/