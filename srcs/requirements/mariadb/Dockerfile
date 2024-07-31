FROM debian:bullseye

RUN apt update && apt install -y mariadb-server
RUN chown -R mysql:mysql /var/lib/mysql/

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/script.sh .
RUN chmod +x script.sh

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["./script.sh"]