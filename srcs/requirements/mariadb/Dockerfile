FROM debian:bullseye

RUN  apt-get update && apt-get install -y mariadb-server -y && apt-get install wget -y

COPY ./50-server.cnf  /etc/mysql/mariadb.conf.d/

COPY ./tools/conf.sh /

RUN chmod +x ./conf.sh

CMD ["./conf.sh", "mysqld"]
