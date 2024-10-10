#!/bin/bash
cd /var/www/html

# Check if WordPress is already downloaded
if [ ! -f wp-config.php ]; then
    echo "Downloading wp-cli..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar

    # Downloads WordPress core files."
    ./wp-cli.phar core download --allow-root

    # Creates wp-config.php"
    ./wp-cli.phar config create --dbname=$WP_DATABASE --dbuser=$SQL_USER --dbpass=$(cat $SQL_PASSWORD) --dbhost=$SQL_DATABASE:3306 --allow-root

    # auto-installs WordPress.
    ./wp-cli.phar core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN --admin_password=$(cat $WP_ADMIN_PASSWORD) --admin_email=$WP_ADMIN_EMAIL --allow-root

else
    echo "WordPress is already installed. Skipping download and configuration."
fi

    ./wp-cli.phar user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root

php-fpm7.4 -F