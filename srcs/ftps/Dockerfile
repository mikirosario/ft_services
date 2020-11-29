# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/11/29 20:59:53 by mrosario         ###   ########.fr        #
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
#RUN 	mkdir /ftps_chroot/
#RUN		openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
#RUN		echo -e "pass\npass" | adduser -h /ftps_chroot/ user
#RUN		chown user:user /ftps_chroot/
#RUN		chmod 700 /ftps_chroot

COPY	ftps.conf /etc/vsftpd/vsftpd.conf


#VOLUME [ "/ftps_chroot" ]

RUN rm -rf /var/cache/apk/*

EXPOSE	20 21 21000-21010
#CMD /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21010 /etc/vsftpd/vsftpd.conf & tail -F /dev/null
CMD . /ftps_init.sh