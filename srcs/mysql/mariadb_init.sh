
#!/bin/sh

#Con OpenRC

#openrc
#touch /run/openrc/softlevel

#chown mysql:mysql var/lib/mysql/
#/etc/init.d/mariadb setup
#/etc/init.d/mariadb start
#echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION;\n
#FLUSH PRIVILEGES;\n" | mysql -u root -p --skip-password
#echo " n y $MYSQL_PASS $MYSQL_PASS y n n y" | tr " " "\n" | mysql_secure_installation
##rc-service mariadb restart
#rc-update add mariadb default


mkdir -p /run/mysqld
cp -rp /var/run/mysqld /var/run/mysqld.bak
chown root:root /var/lib/mysql

mysql_install_db --user=$MYSQL_USER
tmp=sql_tmp

echo -ne "FLUSH PRIVILEGES;\n
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION;\n
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;\n" >> $tmp 
#sustituye wordpress 'pass' por otro secret en pods de mysql y wordpress, configs, etc.

/usr/bin/mysqld --user=$MYSQL_USER --bootstrap --verbose=0 < $tmp
rm -rf $tmp

#Ahora cómo coño creo un usuario wordpressuser...
	#mysql_install_db --user=$MYSQL_USER --password=$MYSQL_PASS
	#echo -ne "CREATE DATABASE wordpress;\n
	#CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'wordpresspass';\n
	#GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%' WITH GRANT OPTION;\n
	#FLUSH PRIVILEGES;\n" >> $tmp

	#/usr/bin/mysqld --user=wordpressuser --bootstrap --verbose=0 < $tmp
	#rm -rf $tmp

		#echo "CREATE DATABASE wordpress;" | mysql -u $MYSQL_USER -p $MYSQL_PASS
		#echo "CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'wordpresspass';" | mysql -u $MYSQL_USER -p $MYSQL_PASS
		#echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%' WITH GRANT OPTION;" | mysql -u $MYSQL_USER -p $MYSQL_PASS

exec /usr/bin/mysqld --user=$MYSQL_USER &