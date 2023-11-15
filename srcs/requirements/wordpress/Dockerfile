FROM   debian:11

RUN apt-get update && apt-get install -y \
    mariadb-client \
    php \
    php-mysql \
    php-fpm \
    wget

RUN service php7.4-fpm start

COPY ./www.conf /etc/php/7.4/fpm/pool.d


RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html
COPY ./tools/wp-config.php /var/www

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Set ownership and permissions
# RUN chown -R www-data:www-data /var/www/html && \
#     chmod -R 755 /var/www/html

COPY /tools/script.sh .

RUN chmod +x ./script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "-F"]
# "./script.sh"]
