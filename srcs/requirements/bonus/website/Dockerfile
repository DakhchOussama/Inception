FROM debian:buster

RUN apt-get -y update && apt-get -y install apache2 

EXPOSE 82

COPY ./tools ./var/www/html

COPY ./conf/apache2.conf ./etc/apache2/apache2.conf

COPY ./conf/ports.conf ./etc/apache2/ports.conf

RUN service apache2 restart

ENTRYPOINT ["/usr/sbin/apache2ctl"]

CMD ["-D", "FOREGROUND"]