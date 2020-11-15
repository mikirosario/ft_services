# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/11/09 19:54:36 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1
RUN apk update

#Nginx Installation
RUN apk add nginx

#Nginx Config
COPY nginx.conf etc/nginx/nginx.conf
COPY miKey.crt /etc/ssl/certs/miKey.crt
COPY miKey.key /etc/ssl/private/miKey.key
#Copy Website
ADD /mikiweb/ /var/lib/nginx/html/


RUN rm -rf /var/cache/apk/*
EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]