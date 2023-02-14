#!/bin/bash
wp core download --path=/var/www/html --allow-root

rm -rf /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config create --dbname=$DB_NAME \
                --dbuser=$DB_USER \
                --dbpass=$DB_PASSWORD \
                --dbhost=$DB_HOST\
                --skip-check \
                --path=/var/www/html/ \
                --allow-root \
                --extra-php<<PHP
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
PHP

wp core install --url=$WP_URL \
                --title=$WP_TITLE \
                --admin_name=$WP_ROOT_USER \
                --admin_password=$WP_ROOT_PASSWORD \
                --admin_email=$WP_ROOT_EMAIL \
                --path=/var/www/html/ \
                --allow-root

wp user create $WP_USER \
                $WP_USER_EMAIL \
                --role=author \
                --user_pass=$WP_PASSWORD \
                --allow-root \
                --path=/var/www/html/

service php7.3-fpm start

wp plugin install redis-cache --allow-root --path='/var/www/html' --activate

wp plugin activate redis-cache --allow-root --path='/var/www/html'

wp redis enable --path=/var/www/html/ --allow-root

service php7.3-fpm stop

chown -R www-data:www-data -f /var/www/html

php-fpm7.3 -F