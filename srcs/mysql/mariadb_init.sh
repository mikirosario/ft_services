
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

TONTI=0

mkdir -p /run/mysqld
cp -rp /var/run/mysqld /var/run/mysqld.bak
chown root:root /var/lib/mysql

mysql_install_db --user=$MYSQL_USER
tmp=sql_tmp

echo -ne "FLUSH PRIVILEGES;\n
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION;\n
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;\n" >> $tmp 
#sustituye wordpress 'pass' por otro secret en pods de mysql y wordpress, configs, etc.

/usr/bin/mysqld --user=$MYSQL_USER --bootstrap --verbose=0 < $tmp
rm -rf $tmp
/usr/bin/mysqld --user=$MYSQL_USER &

#If the (persistent) wordpress database directory is empty...
if [ ! "$(ls -A var/lib/mysql/wordpress/)" ]
then
	#Wait for mysql to be running...
	while [ $TONTI == 1 ]
	do
		sleep 5
		ps aux | grep -v "grep" | grep "/usr/bin/mysqld"
		#When mysql is running...
		if [ $? == 0 ]
		then
			#Load this starter database...
			TONTI=1
			mysql -u $MYSQL_USER --password=$MYSQL_PASS wordpress < wordpress.sql
		fi
	done
fi