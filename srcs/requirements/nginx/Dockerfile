FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y

# C : le pays.
# ST : l'état ou la province.
# L : la localité ou la ville.
# O : l'organisation.
# OU : l'unité d'organisation.
# CN : le nom commun
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=France/L=Angouleme/O=Ecole42/OU=42/CN=aranger42"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
