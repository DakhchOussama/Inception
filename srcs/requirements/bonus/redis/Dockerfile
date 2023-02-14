FROM debian:buster

RUN apt-get -y update && apt-get -y install redis-server

EXPOSE 6379

COPY ./conf/redis.conf ./etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf"]