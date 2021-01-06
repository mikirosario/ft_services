# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2021/01/06 12:57:20 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1

# Install Telegraf and Grafana
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&& apk update && apk add telegraf=1.17.0-r0 && apk update && apk add libc6-compat \
&& rm -rf /var/cache/apk/* \
&& wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz \
&& tar -zxvf grafana-7.3.6.linux-amd64.tar.gz \
&& rm grafana-7.3.6.linux-amd64.tar.gz \
&& rm grafana-7.3.6/conf/sample.ini \

#Copy all the things
COPY telegraf.conf custom.ini key.pem cert.pem /tmp/

#Copy starter database
COPY backup /influxdb_backup

#Copy Grafana initiation script
COPY start_grafana.sh ./start_grafana.sh

EXPOSE 3000
CMD ash start_grafana.sh