#!/bin/bash

adduser $FTP_CLIENT --gecos "" --disabled-password

echo "$FTP_CLIENT:$FTP_PASS" | chpasswd

chown -R $FTP_CLIENT /var/www/html

/usr/sbin/vsftpd