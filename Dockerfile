# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 00:15:19 by miki              #+#    #+#              #
#    Updated: 2020/10/30 22:17:35 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update

#Nginx Installation
RUN apk add nginx

#Nginx Config
COPY nginx.conf etc/nginx/nginx.conf
COPY myCA.crt /etc/ssl/certs/myCA.crt
COPY myCA.key /etc/ssl/private/myCA.key



RUN rm -rf /var/cache/apk/*
EXPOSE 80 443

CMD ["nginx", "-g", "pid /tmp/nginx.pid;"]