# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/04 12:02:28 by mrosario          #+#    #+#              #
#    Updated: 2021/01/06 21:05:14 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM alpine:3.12.1
#
#Update and install OpenRC, PHP, and Telegraf + Make Wordpress Directory
RUN apk update && apk add openrc lighttpd php7-common php7-iconv php7-json php7-gd \
php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom libc6-compat \
php7-zlib && rm -rf /var/cache/apk/* \
&& mkdir -p /usr/share/webapps/wordpress \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz \
&& rm telegraf-1.17.0_linux_amd64.tar.gz

#Copy Wordpress Files
COPY wordpress/ /usr/share/webapps/wordpress/

#Copy all the things
COPY telegraf.conf wp-config.php lighttpd.conf /tmp/

#Copy Wordpress initiation script
COPY wordpress_start.sh /wordpress_start.sh

EXPOSE 5050
CMD ash ./wordpress_start.sh
#CMD tail -F /dev/null