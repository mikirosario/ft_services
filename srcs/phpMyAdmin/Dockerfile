# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/31 13:23:56 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#ARG IP

# Install packages
RUN apk update && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session libc6-compat
#RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Download PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /www \
&& rm -rf /var/cache/apk/*

# Install telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf ./telegraf-1.17.0/telegraf.conf

COPY start_php.sh ./start_php.sh

# We get save the external IP
#RUN echo $IP > ip.txt

# PHPMyAdmin config file
COPY config.inc.php /www/config.inc.php

# Telegraf setup
#RUN mkdir -p /etc/telegraf
#COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000
#CMD php -S 0.0.0.0:5000 -t /www/
CMD ash start_php.sh