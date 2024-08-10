#!/bin/bash

sleep 10 
ping mariadb -c 3
cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
  wp core download --allow-root
  wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
  wp core install --allow-root --url="aranger.42.fr" --title="Hello" --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --path='/var/www/wordpress'
  wp user create --allow-root $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=subscriber
  chmod -R 775 wp-content
  echo "Configuration terminée."
else
  echo "wp-config.php already exists."
fi

echo "avant"

php-fpm7.4 -F

echo "php-fpm7.4 launched"