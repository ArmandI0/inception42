#!/bin/bash

# Démarrer MariaDB
mysqld

# Garder le conteneur en fonctionnement
tail -f /var/log/mysql/error.log

# Démarrer MariaDB
# mariadbd
# mariadbd --user=mysql &

# # Attendre que MariaDB soit prêt
# echo "Waiting for MariaDB to start..."
# sleep 30 # Augmenter le délai si nécessaire, ou utilisez une vérification plus robuste

# # Vérifier si MariaDB est démarré
# mysqladmin ping -h127.0.0.1 --silent
# if [ $? -ne 0 ]; then
#   echo "MariaDB is not available. Exiting script."
#   exit 1
# fi

# # Créer la base de données si elle n'existe pas déjà
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# # Créer un utilisateur si il n'existe pas déjà et lui attribuer un mot de passe
# mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # Accorder tous les privilèges sur la base de données à l'utilisateur
# mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;"

# # Modifier le mot de passe de l'utilisateur root
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# # Rafraîchir les privilèges pour prendre en compte les modifications
# mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# # Arrêter le service mysql (ceci peut ne pas être nécessaire)
# # mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# # Démarrer MariaDB en premier plan
# exec mariadbd