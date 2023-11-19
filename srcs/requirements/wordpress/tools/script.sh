#!/bin/sh

sleep 3;
if [ -f ./wp-config.php ]
then
	echo "donne\n";
else
	cp /var/www/wp-config.php /var/www/html
	wp core download --allow-root
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --force --allow-root
fi

exec "$@"