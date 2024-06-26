#!/bin/bash

IMAGE_NAME="mariadb"
NEW_TAG="latest"
OLD_TAG="<none>"

# Construire la nouvelle image
docker build -t $IMAGE_NAME:$NEW_TAG .

# Supprimer l'ancienne image
docker rmi $IMAGE_NAME:$OLD_TAG