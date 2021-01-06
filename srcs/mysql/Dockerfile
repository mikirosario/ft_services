# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2021/01/06 21:04:48 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#
#Update and install OpenRC, MySQL and Telegraf
RUN apk update && apk add curl mysql=10.4.15-r0 mysql-client=10.4.15-r0 libc6-compat \
&& rm -rf /var/cache/apk/* \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz \
&& rm telegraf-1.17.0_linux_amd64.tar.gz

#Copy all the things
COPY telegraf.conf mariadb-server.cnf wordpress.sql /tmp/

#Copy execution script
COPY mariadb_init.sh /mariadb_init.sh

RUN mkdir -p /var/lib/mysql

#VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306
CMD ash ./mariadb_init.sh
#CMD tail -F /dev/null