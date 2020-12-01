# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/12/01 22:37:13 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.1

#Nginx Installation
RUN apk update && apk add nginx && rm -rf /var/cache/apk/*

#Nginx Config
RUN mkdir /etc/nginx/ssl
COPY nginx.conf /etc/nginx/nginx.conf

#Copy Website
COPY /mikiweb/ /var/lib/nginx/html/

EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]