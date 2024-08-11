FROM debian:bullseye

# Installer MariaDB
RUN apt update && apt install -y mariadb-server systemd

# Configurer les permissions
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql/ /run/mysqld

# Copier les fichiers de configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copier le script de démarrage
COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Exposer le port MariaDB
EXPOSE 3306

# Utiliser le script comme point d'entrée
ENTRYPOINT ["/usr/local/bin/script.sh"]