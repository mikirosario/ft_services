# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/31 10:08:48 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#
#Update and install openrc and mysql
RUN apk update && apk add curl mysql=10.4.15-r0 mysql-client=10.4.15-r0 libc6-compat && rm -rf /var/cache/apk/*
#RUN apk update && apk add openrc mysql mysql-client && rm -rf /var/cache/apk/*

#Telegraf Config
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf ./telegraf-1.17.0/telegraf.conf

#Temporary insecure user/pass for testing
#ENV MYSQL_DATABASE wordpress
#ENV DB_USER=user
#ENV DB_PASSWORD=pass

RUN mkdir -p /var/lib/mysql

VOLUME [ "/var/lib/mysql" ]

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY mariadb_init.sh /mariadb_init.sh
COPY wordpress.sql ./wordpress.sql
#COPY wordpressdb.sql ./wordpressdb.sql

EXPOSE 3306
CMD ash ./mariadb_init.sh
#CMD tail -F /dev/null