#!/bin/bash
docker run -d --name my-wordpress \
  -e WORDPRESS_DB_HOST=<database_host> \
  -e WORDPRESS_DB_NAME=<database_name> \
  -e WORDPRESS_DB_USER=<database_user> \
  -e WORDPRESS_DB_PASSWORD=<database_password> \
  -v /path/to/wp-content:/var/www/html/wp-content \
  -p 9000:9000 \
  wordpress:latest

php-fpm8.1 -F