#!/bin/bash
# Create the directory for the MySQL socket if it doesn't exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Start the MySQL service
mysql_install_db
mysqld --datadir='/var/lib/mysql' --user=mysql