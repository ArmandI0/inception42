FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php php-fpm php-mysql mariadb-client

# RUN mkdir -p /var/www/wordpress
# RUN cd /var/www
# RUN chmod 755 -R /var/www/wordpress
# RUN chown -R root:root /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/wordpress


RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xzvf  latest.tar.gz && chown -R root:root wordpress

RUN apt-get install vim -y
COPY /conf/vimrc /etc/vim/vimrc
COPY /conf/php.ini /etc/php/7.4/cli/php.ini
COPY /conf/auto_config.sh   /var/www/wordpress/
RUN chmod +x ./var/www/wordpress/auto_config.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#ENTRYPOINT [ "./var/www/wordpress/auto_config.sh" ]