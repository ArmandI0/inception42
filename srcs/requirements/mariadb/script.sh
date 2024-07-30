#!/bin/bash

service mariadb start

echo "Starting script.sh..."

# Vérifier les variables d'environnement
echo "SQL_USER: ${SQL_USER}"
echo "SQL_PASSWORD: ${SQL_PASSWORD}"
echo "SQL_DATABASE: ${SQL_DATABASE}"
echo "SQL_ROOT_PASSWORD: ${SQL_ROOT_PASSWORD}"

echo "Starting MariaDB service..."

sleep 10

# Créer la base de données si elle n'existe pas déjà
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer un utilisateur si il n'existe pas déjà et lui attribuer un mot de passe
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Accorder tous les privilèges sur la base de données à l'utilisateur
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '$SQL_USER'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modifier le mot de passe de l'utilisateur root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Rafraîchir les privilèges pour prendre en compte les modifications
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Arrêter le service mysql
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# Démarrer mysql en mode sécurisé
exec mariadb