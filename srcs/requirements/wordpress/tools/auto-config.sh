#!/bin/bash
cd /var/www/html

# Check if WordPress is already downloaded
if [ ! -f wp-config.php ]; then
    echo "Downloading wp-cli."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar

    # Downloads WordPress core files."
    ./wp-cli.phar core download --allow-root

    # Creates wp-config.php"
    ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb:3306 --allow-root

    # auto-installs WordPress.
    ./wp-cli.phar core install --url=localhost --title=inception --admin_user=$WORDPRESS_USER --admin_password=$(cat /run/secrets/credentials) --admin_email=$WORDPRESS_EMAIL --allow-root
else
    echo "WordPress is already installed. Skipping download and configuration."
fi

php-fpm7.4 -F