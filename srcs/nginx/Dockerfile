# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2021/01/04 20:10:41 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1

#Update and Install Nginx, OpenSSH and Telegraf
RUN apk update && apk add nginx openssh libc6-compat && rm -rf /var/cache/apk/* \
&& mkdir /etc/nginx/ssl \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.0_linux_amd64.tar.gz \
&& rm telegraf-1.17.0_linux_amd64.tar.gz

#Copy all the things
COPY nginx.conf telegraf.conf motd /tmp/

#Copy Website
COPY /mikiweb/ /var/lib/nginx/html/

#Copy nginx initiation script
COPY start_nginx.sh ./start_nginx.sh

EXPOSE 80 443 22

CMD ash start_nginx.sh