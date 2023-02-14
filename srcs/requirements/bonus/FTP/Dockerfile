FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN service vsftpd start

COPY ./conf/vsftpd.conf ./etc/

COPY ./tools/script.sh /
RUN chmod +x /script.sh

RUN service vsftpd stop

ENTRYPOINT ["./script.sh"]