CREATE DATABASE IF NOT EXISTS inception;
CREATE USER 'odakhch' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON inception.* TO 'odakhch'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root42';