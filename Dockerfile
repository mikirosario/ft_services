# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: miki <miki@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/10/29 01:23:57 by miki             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update

#Nginx Installation
RUN apk add nginx

#Nginx Config
COPY nginx.conf etc/nginx/nginx.conf


RUN rm -rf /var/cache/apk/*
EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]