FROM alpine

RUN apk --no-cache --update \
    add apache2 \
    php82-apache2

RUN sed -i 's#^DocumentRoot ".*#DocumentRoot "/var/www/"#g' /etc/apache2/httpd.conf \
    && sed -i 's#Directory "/var/www/localhost/htdocs"#Directory "/var/www/"#g' /etc/apache2/httpd.conf

COPY src/index.php /var/www/index.php
 
EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
