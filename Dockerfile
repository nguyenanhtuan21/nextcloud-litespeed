FROM litespeedtech/openlitespeed:1.6.20-lsphp74

RUN apt-get install -y nano
COPY /nextcloud /var/www/vhosts/localhost/html
COPY config/php /usr/local/lsws/lsphp74/etc/php/7.4/litespeed/
COPY config/docker /usr/local/lsws/conf/templates/

COPY php_restart/.lsphp_restart.txt /usr/local/lsws/admin/tmp/.lsphp_restart.txt

RUN touch /usr/local/lsws/admin/tmp/.lsphp_restart.txt

RUN service lsws restart