FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4-fpm php7.4-mysqli curl iputils-ping

RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php

COPY /conf/wp-config.sh  .
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN chmod +x wp-config.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Ajuster les permissions du fichier PID de PHP-FPM
RUN touch /var/run/php/php7.4-fpm.pid && \
    chown www-data:www-data /var/run/php/php7.4-fpm.pid

ENTRYPOINT ["./wp-config.sh"]