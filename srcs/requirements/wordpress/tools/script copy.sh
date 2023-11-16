#!/bin/bash

sleep 3;
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;
if [ ! -f /var/www/html/wp-config.php ]; then
  echo "Wordpress: setting up..."
  cd /var/www/html
  wp core download --allow-root
  wp config create 
  mv /var/www/wp-config.php /var/www/html/
  echo "Wordpress: creating users..."
  wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
  wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
  wp plugin install redis-cache --activate --allow-root
  wp plugin update --all --allow-root
  wp plugin activate redis-cache --allow-root
  wp redis enable --force --allow-root
fi
exec "$@"
