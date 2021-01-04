mv /tmp/nginx.conf /etc/nginx/nginx.conf
mv /tmp/telegraf.conf /telegraf-1.17.0/telegraf.conf
mv /tmp/motd /etc/motd
adduser -D user
export TONTI=`echo -e $SSL_USER:$SSL_PASS | sed "s/ //g"` #I'm forced to use sed to take the white spaces out, otherwise SHELL interprets it as SSL_USER :SSL_USER ***ROLL_EYES***
echo $TONTI | chpasswd #In revenge for all the time lost, I store the proper string in a variable called TONTI. SHAME! SHAME!
ssh-keygen -A
/usr/sbin/sshd
/etc/motd
cd ./telegraf-1.17.0/usr/bin && ./telegraf --config /telegraf-1.17.0/telegraf.conf &
nginx -g 'pid /tmp/nginx.pid;'