FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server

EXPOSE 3306

COPY ./conf/create_db.sql ./

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql -uroot < create_db.sql

CMD ["mysqld"]