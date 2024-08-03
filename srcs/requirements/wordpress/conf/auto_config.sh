#!/bin/bash

sleep 10

cd /var/www/wordpress

if ! [ -e wp-config.php ]; then
	wp core downlo
	wp config create --allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'


wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'