# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/31 19:39:55 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
#ARG IP

# Install packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && apk update && apk add telegraf=1.17.0-r0 && apk update && apk add libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz \
&& tar -zxvf grafana-7.3.6.linux-amd64.tar.gz \
&& rm grafana-7.3.6/conf/sample.ini

COPY start_grafana.sh ./start_grafana.sh
COPY telegraf.conf ./telegraf.conf
COPY custom.ini /grafana-7.3.6/conf/custom.ini
COPY key.pem /grafana-7.3.6/
COPY cert.pem /grafana-7.3.6/

EXPOSE 3000
CMD ash start_grafana.sh