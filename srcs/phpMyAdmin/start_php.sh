mv /tmp/telegraf.conf /telegraf-1.17.0/telegraf.conf
mv /tmp/config.inc.php /www/config.inc.php
cd ./telegraf-1.17.0/usr/bin && ./telegraf --config /telegraf-1.17.0/telegraf.conf &
php -S 0.0.0.0:5000 -t /www/