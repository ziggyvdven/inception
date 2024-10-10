FROM debian:bullseye-slim

RUN apt-get update -y && apt-get upgrade -y && \
	apt install -y \
	php-fpm \
	php-mysqli \
	curl && \
	mkdir -p /run/php && \
    chown -R www-data:www-data /run/php


#copies the configuration from the host to the container
COPY ./conf/www.conf ./etc/php/7.4/fpm/pool.d/www.conf

#copies the wordpress configuration script from the host to the container
COPY ./tools/auto-config.sh /auto-config.sh
RUN chmod +x auto-config.sh

# Expose the port
EXPOSE 9000

# ENTRYPOINT [ "./auto-config.sh" ]
CMD ["./auto-config.sh"]