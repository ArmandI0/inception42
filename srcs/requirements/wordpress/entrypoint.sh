#!/bin/bash
set -e

# Démarrer PHP-FPM en arrière-plan
# Garder le conteneur actif en surveillant un fichier de log
# Utiliser /var/log/php-fpm.log comme un fichier de log fictif pour éviter l'erreur
tail -f /var/log/php-fpm.log