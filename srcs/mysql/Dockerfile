# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/15 20:47:17 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#
#Update and install openrc and mysql
RUN apk update && apk add curl mysql=10.4.15-r0 mysql-client=10.4.15-r0 && rm -rf /var/cache/apk/*
#RUN apk update && apk add openrc mysql mysql-client && rm -rf /var/cache/apk/*

#Temporary insecure user/pass for testing
ENV MYSQL_DATABASE wordpress
ENV DB_USER=user
ENV DB_PASSWORD=pass

RUN mkdir -p /var/lib/mysql

VOLUME [ "/var/lib/mysql" ]

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY mariadb_init.sh /mariadb_init.sh

EXPOSE 3306
CMD ash ./mariadb_init.sh && tail -F /dev/null
#CMD tail -F /dev/null