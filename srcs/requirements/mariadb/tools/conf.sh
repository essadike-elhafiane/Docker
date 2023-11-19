#!/bin/bash

mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mariadb -e "CREATE USER IF NOT EXISTS 'essadike'@'%' IDENTIFIED BY '12345';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO '12345'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"
