FROM debian:bullseye-slim

RUN apt-get update -y && apt upgrade -y && \
	apt-get install -y mariadb-server

#copies the configuration from the host to the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./conf/init.sql /etc/mysql/init.sql
COPY ./tools/entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose the port
EXPOSE 3306

#We need this folder to run mysqld
RUN mkdir /run/mysqld

ENTRYPOINT [ "./entrypoint.sh" ]
