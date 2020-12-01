# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/01 22:58:04 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# --- Env variables
# FTPS_USER <- Username of the user you want to create
# FTPS_PASS <- The password of the user

FROM alpine:3.12.1
RUN apk update

#Install vsftpd
RUN		apk add vsftpd
RUN		apk add openssl
RUN		apk add curl
COPY	ftps_init.sh ./ftps_init.sh
COPY	ftps.conf /etc/vsftpd/vsftpd.conf

RUN rm -rf /var/cache/apk/*

EXPOSE	20 21 30020-30030
CMD . /ftps_init.sh