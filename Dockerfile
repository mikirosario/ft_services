# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: miki <miki@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/10/30 00:50:23 by miki             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update

#Nginx Installation
RUN apk add nginx

#openssl Installation
RUN apk add openssl

#Nginx Config
COPY nginx.conf etc/nginx/nginx.conf

#SSH Keygen. My private key is very secure, no one would ever guess the password! :)
RUN yes 123456789 | openssl genrsa -des3 -out myCA.key 2048
ADD sshconfig.sh ./
RUN chmod 755 sshconfig.sh
RUN ./sshconfig.sh



RUN rm -rf /var/cache/apk/*
EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]