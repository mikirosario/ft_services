# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/10/31 19:35:08 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update

#Nginx Installation
RUN apk add nginx

#Nginx Config
COPY nginx.conf etc/nginx/nginx.conf
COPY miKey.crt /etc/ssl/certs/miKey.crt
COPY miKey.key /etc/ssl/private/miKey.key



RUN rm -rf /var/cache/apk/*
EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]