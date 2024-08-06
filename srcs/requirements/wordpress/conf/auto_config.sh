#!/bin/bash

sleep 10 
ping mariadb -c 3
cd /var/www/wordpress

wp config create --allow-root \
				--dbname=$SQL_DATABASE \
				--dbuser=$SQL_USER \
				--dbpass=$SQL_PASSWORD \
				--dbhost=mariadb:3306 --path='/var/www/wordpress'

echo "Configuration terminée."

php-fpm7.4 -F
#wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'