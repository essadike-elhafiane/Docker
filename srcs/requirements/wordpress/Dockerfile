FROM   debian:buster

RUN apt-get update && apt-get install -y \
    mariadb-client \
    php7.3 \
    php7.3-mysql \
    php7.3-fpm \
    wget

RUN service php7.3-fpm start
COPY ./conf /etc/php/7.3/fpm/pool.d/www.conf
RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html
WORKDIR /var/www/html


COPY /tools/script.sh .

RUN chmod +x ./script.sh

EXPOSE 9000


CMD ["php-fpm7.3", "--nodaemonize" "./script.sh"]
