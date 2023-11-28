#!/bin/sh

sleep 3;
if [ -f "./var/www/html/wp-config.php" ]; then
	echo "File exists."
else
	wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz
	wp core download --allow-root
	wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${WP_ADMIN_LOGIN} --dbpass=${WP_ADMIN_PASSWORD} --dbhost=${DB_HOST} --path='/var/www/html'
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT eelhafia.42.fr --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	# wp plugin activate redis-cache --allow-root
	wp redis enable --force --allow-root
	
fi

exec "$@"
php-fpm7.4 -F