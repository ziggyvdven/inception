FROM debian:bullseye-slim

RUN apt-get update -y && apt-get upgrade -y && \
	# apt-get -y install wget && \
	apt install -y \
	php-fpm \
	php-mysqli \
	curl && \
	mkdir -p /run/php && \
    chown -R www-data:www-data /run/php
	# which php
	# php-mysql\
	# mariadb-client && \
	# wget https://en-ca.wordpress.org/wordpress-6.6.2-en_CA.tar.gz -P /var/www && \
	# cd /var/www && tar -xzf wordpress-6.6.2-en_CA.tar.gz && \
	# rm wordpress-6.6.2-en_CA.tar.gz && \
	# chown -R root:root /var/www/wordpress && \
	# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	# chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


	# /etc/php/7.4/fpm/pool.d/www.conf ./requirements/wordpress/conf/.

#copies the configuration from the host to the container
COPY ./conf/www.conf ./etc/php/7.4/fpm/pool.d/www.conf

#copies the wordpress configuration script from the host to the container
COPY ./tools/auto-config.sh /auto-config.sh
RUN chmod +x auto-config.sh

# Expose the port
EXPOSE 9000
# ENTRYPOINT [ "./auto-config.sh" ]

CMD ["./auto-config.sh"]