#!/bin/bash
mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe
