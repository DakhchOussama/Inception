FROM debian:buster

RUN apt-get update && apt-get install -y \
    wget \
    apache2 \
    php \
    php-mysql \
    libapache2-mod-php \
    dumb-init; \
    cd /var/www/html; rm -rf *; \
    wget https://www.adminer.org/latest.php -O /var/www/html/index.php;

EXPOSE 80

COPY ./conf/apache2.conf ./etc/apache2/apache2.conf

COPY ./conf/ports.conf ./etc/apache2/ports.conf

RUN service apache2 restart

ENTRYPOINT ["/usr/bin/dumb-init", "apache2ctl"]

CMD ["-D", "FOREGROUND"]