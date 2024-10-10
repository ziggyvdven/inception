#!/bin/bash
# Create the directory for the MySQL socket if it doesn't exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

mysql_install_db -u root --force

# Write SQL commands to the init.sql file
echo "CREATE DATABASE wordpress;" > /etc/mysql/init.sql
echo "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

# Start the MySQL service as the main process
mysqld --datadir='/var/lib/mysql'