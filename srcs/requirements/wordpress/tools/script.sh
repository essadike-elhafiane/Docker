#!/bin/sh

sleep 10;
if [ -f ./var/www/html/wp-config.php ]
then
	echo "donne\n";
else
	# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	# sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '${DB_HOST}' );/g" /var/www/html/wp-config.php
	# sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '${MARIADB_DATABASE}' );/g" /var/www/html/wp-config.php
	# sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${WP_ADMIN_LOGIN}' );/g" /var/www/html/wp-config.php
	# sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${WP_ADMIN_PASSWORD}' );/g" /var/www/html/wp-config.php
	wp core download --allow-root
	wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${WP_ADMIN_LOGIN} --dbpass=${WP_ADMIN_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/html'
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --force --allow-root
fi

exec "$@"
php-fpm7.4 -F