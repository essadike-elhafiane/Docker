FROM debian:bullseye

RUN  apt-get update && apt-get install -y \
     mariadb-server\
     mariadb-client

COPY ./50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/s.sh /

RUN chmod +x ./s.sh

CMD service mariadb start && sh -c "./s.sh" && mysqld_safe
