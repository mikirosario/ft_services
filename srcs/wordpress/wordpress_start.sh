#This basically just follows the Wordpress Alpine tutorial, with a couple of differences to adapt to K8S.

mv /tmp/telegraf.conf /telegraf-1.17.0/telegraf.conf
mv /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf
chown -R lighttpd /usr/share/webapps/
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
mv /tmp/wp-config.php /var/www/localhost/htdocs/wordpress/
openrc
touch /run/openrc/softlevel
rc-service lighttpd start && rc-update add lighttpd default
rc-service lighttpd stop
cd ./telegraf-1.17.0/usr/bin && ./telegraf --config /telegraf-1.17.0/telegraf.conf &
exec lighttpd -D -f etc/lighttpd/lighttpd.conf