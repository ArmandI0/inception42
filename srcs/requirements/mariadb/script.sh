#!/bin/bash


#variable d'environement a rajouter dans le .env

# SQL_USER="aranger42"
# SQL_PASSWORD="0000"
# SQL_DATABASE="newdb"
# SQL_ROOT_PASSWORD="ademine"

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" #remplacer newdb par $VAR
mysql -e "CREATE USER IF NOT EXISTS $SQL_USER IDENTIFIED BY $SQL_PASSWORD;"
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER IDENTIFIED BY $SQL_PASSWORD;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $SQL_ROOT_PASSWORD;"
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe