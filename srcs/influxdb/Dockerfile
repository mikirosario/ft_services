# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/30 15:11:17 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#ARG IP

# Install packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && apk update && apk add influxdb=1.8.0-r1 telegraf=1.17.0-r0

COPY start_influx.sh ./start_influx.sh
COPY telegraf.conf ./telegraf.conf

EXPOSE 8086
CMD ash start_influx.sh