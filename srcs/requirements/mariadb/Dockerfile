FROM debian:bullseye

RUN  apt-get update && apt-get install -y \
     mariadb-server\
     mariadb-client

COPY ./50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/initial_db.sql /var

COPY ./tools/s.sh /
# COPY ./tools/conf.sh /

RUN chmod +x /var/initial_db.sql

ENV  MARIADB_ROOT_PASSWORD=12345\
     MARIADB_USER=essadike\
     MARIADB_PASSWORD=12345\
     MARIADB_DATABASE=wordpress
     
RUN chmod +x ./s.sh
# RUN chmod +x ./conf.sh

# RUN mariadb -u root -p"12345" < /var/initial_db.sql
# ENTRYPOINT [ "./conf.sh" ]

CMD service mariadb start && sh -c "./s.sh" && mysqld_safe
