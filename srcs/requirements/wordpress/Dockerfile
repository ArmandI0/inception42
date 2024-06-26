FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xzvf  latest.tar.gz
RUN	cd /var/www/ && chown -R root:root wordpress
RUN apt-get install vim