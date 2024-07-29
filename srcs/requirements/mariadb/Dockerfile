FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh .

RUN chmod +x script.sh
CMD ["./script.sh"]