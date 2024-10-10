FROM debian:bullseye

RUN apt update && apt upgrade -y &&\
	mkdir -p /etc/nginx/ssl &&\
	apt install nginx openssl -y &&\
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key \
	-subj "/C=CA/ST=QC/L=Quebec/O=42/OU=inception/CN=inception" && \
	mkdir -p /run/nginx &&\
	chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY ./conf/default ./etc/nginx/sites-available/.

CMD [ "nginx", "-g", "daemon off;" ]