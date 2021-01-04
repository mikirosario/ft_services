mv /tmp/telegraf.conf /telegraf-1.17.0/telegraf.conf
mv /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf
chown -R lighttpd /usr/share/webapps/
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
mv /tmp/wp-config.php /var/www/localhost/htdocs/wordpress/
openrc
touch /run/openrc/softlevel
rc-service lighttpd start && rc-update add lighttpd default
tail -F /dev/null