# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/31 13:46:17 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1

#Update and install vsftpd and openssl
RUN apk update && apk add vsftpd openssl libc6-compat && rm -rf /var/cache/apk/*

#Telegraf Config
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf ./telegraf-1.17.0/telegraf.conf

#Copy vsftpd initiation script
COPY	ftps_init.sh ./ftps_init.sh

#Copy vsftpd configuration file
COPY	ftps.conf /etc/vsftpd/vsftpd.conf

EXPOSE	20 21 30020-30030
CMD ash ftps_init.sh