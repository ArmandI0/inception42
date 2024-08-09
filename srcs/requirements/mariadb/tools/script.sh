#!/bin/bash

# Démarrer MariaDB en mode sécurisé
mysqld_safe --datadir='/var/lib/mysql' &

# Attendre que MariaDB démarre complètement
until mysqladmin ping --silent; do
    echo "En attente du démarrage de MariaDB..."
    sleep 2
done

echo "MariaDB démarré avec succès."

# Vérifier si la base de données existe
DB_EXISTS=$(mysql -u root -p${SQL_ROOT_PASSWORD} -e "SHOW DATABASES LIKE '${SQL_DATABASE}';" | grep ${SQL_DATABASE} > /dev/null; echo "$?")
if [ $DB_EXISTS -eq 0 ]; then
    echo "La base de données ${SQL_DATABASE} existe déjà."
else
    # Créer la base de données si elle n'existe pas déjà
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

    # Créer un utilisateur et lui attribuer un mot de passe
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

    # Accorder tous les privilèges sur la base de données à l'utilisateur
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;"

    # Modifier le mot de passe de l'utilisateur root
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

    # Rafraîchir les privilèges pour prendre en compte les modifications
    mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

    echo "Configuration terminée."
fi

# Redémarrer MariaDB
exec mysqld_safe --datadir='/var/lib/mysql'


# #!/bin/bash

# # Démarrer MariaDB en mode sécurisé
# mysqld_safe --datadir='/var/lib/mysql' &

# # Attendre que MariaDB démarre complètement
# until mysqladmin ping --silent; do
#     echo "En attente du démarrage de MariaDB..."
#     sleep 2
# done

# echo "MariaDB démarré avec succès."

# DB_EXISTS=$(mysql -u root -p${SQL_ROOT_PASSWORD} -e "SHOW DATABASES LIKE '${SQL_DATABASE}';" | grep ${SQL_DATABASE} > /dev/null; echo "$?")
# if [ $DB_EXISTS -eq 0 ]; then
#     echo "La base de données ${DB_NAME} existe déjà."
# else

# # Créer la base de données si elle n'existe pas déjà
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# # Créer un utilisateur si il n'existe pas déjà et lui attribuer un mot de passe
# mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # Accorder tous les privilèges sur la base de données à l'utilisateur
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;"

# # Modifier le mot de passe de l'utilisateur root
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# # Rafraîchir les privilèges pour prendre en compte les modifications
# mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# echo "Configuration terminée."

# fi

# exec mariadbd
