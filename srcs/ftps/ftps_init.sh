# --- FTPS setup ---
mv /tmp/ftps.conf /etc/vsftpd/vsftpd.conf
openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
if [ ! -d "/ftps_chroot" ]
then
	mkdir ftps_chroot /dev/null
fi
echo -n "$FTPS_PASS$FTPS_PASS" | adduser -h /ftps_chroot/ $FTPS_USER
export TONTI=`echo -e $FTPS_USER:$FTPS_USER | sed "s/ //g"` #I'm forced to use sed to take the white spaces out, otherwise SHELL interprets it as FTPS_USER :FTPS_USER ***ROLL_EYES***
chown $TONTI /ftps_chroot #In revenge for all the time lost, I store the proper string in a variable called TONTI. SHAME! SHAME!

chmod 700 /ftps_chroot

# -- Start Telegraf ---
mv /tmp/telegraf.conf /telegraf-1.17.0/telegraf.conf
cd ./telegraf-1.17.0/usr/bin && ./telegraf --config /telegraf-1.17.0/telegraf.conf &

# -- Start FTP server ---
printf "FTPS server is starting !\n"
exec /usr/sbin/vsftpd -opasv_min_port=30020 -opasv_max_port=30030 /etc/vsftpd/vsftpd.conf
