FROM debian:bullseye

RUN  apt-get update && apt-get install -y mariadb-server -y && apt-get install wget -y

RUN mkdir /etc/database

COPY conf ./etc/mysql/mariadb.conf.d/conf

COPY ./tools/conf.sh /

RUN chmod +x ./conf.sh

CMD ["./conf.sh"]
