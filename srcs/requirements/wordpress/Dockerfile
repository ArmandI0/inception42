FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4-fpm php7.4-mysqli curl iputils-ping

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xzvf  latest.tar.gz && chown -R root:root wordpress

RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php

COPY /conf/auto_config.sh  .
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN chmod +x auto_config.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Ajuster les permissions du fichier PID de PHP-FPM
RUN touch /var/run/php/php7.4-fpm.pid && \
    chown www-data:www-data /var/run/php/php7.4-fpm.pid

CMD ["./auto_config.sh"]