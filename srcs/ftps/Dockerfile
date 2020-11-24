# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/11/24 22:40:46 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# --- Env variables
# FTPS_USER <- Username of the user you want to create
# FTPS_PASS <- The password of the user

FROM	alpine

# RUN		apk add vsftpd

# ADD		srcs/vsftpd.conf /etc/vsftpd/
# ADD		srcs/ /root

EXPOSE	20 21 21000-21004

VOLUME [ "/ftp" ]

CMD [ "/bin/ash", "/root/init.sh" ]