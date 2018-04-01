FROM richarvey/nginx-php-fpm:latest

RUN mkdir -p /var/www/html && \
    chown nginx /var/www/html && \
    sed -i 's/=404/\/index.php\?\$query\_string/g' /etc/nginx/sites-enabled/default.conf
