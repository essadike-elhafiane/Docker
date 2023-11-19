#!/bin/bash
sleep 3;
mariadb -u root -p"12345" -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mariadb -u root -p"12345" -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -u root -p"12345" -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -u root -p"12345" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mariadb -u root -p"12345" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe
