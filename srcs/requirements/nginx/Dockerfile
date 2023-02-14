FROM debian:buster

RUN apt-get update && \
    apt-get -y install nginx  && \
    apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/odakhch.key \
    -out /etc/ssl/certs/odakhch.crt \
    -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=1337/OU=odakhch/CN=odakhch.42.fr"

COPY ./conf/default ./etc/nginx/sites-available/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]