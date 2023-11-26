FROM debian:11

RUN apt-get update && \
    apt-get install -y \
    mariadb-client \
    wget  \
    php \
    php-fpm\
    php-mysql

RUN mkdir -p /run/php 

RUN mkdir -p /var/www/html/
RUN wget -O /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php 
COPY ./www.conf /etc/php/7.4/fpm/pool.d

EXPOSE 9000


# STOPSIGNAL SIGQUIT

# Start PHP-FPM in non-daemon mode
ENTRYPOINT ["php-fpm7.4", "--nodaemonize"]