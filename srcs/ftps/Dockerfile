# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2021/01/06 21:04:18 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1

#Update and install vsftpd, OpenSSL and Telegraf
RUN apk update && apk add vsftpd openssl libc6-compat && rm -rf /var/cache/apk/* \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz \
&& rm telegraf-1.17.0_linux_amd64.tar.gz

#Copy all the things
COPY telegraf.conf ftps.conf /tmp/

#Copy vsftpd initiation script
COPY	ftps_init.sh ./ftps_init.sh

EXPOSE	20 21 30020-30030
CMD ash ftps_init.sh