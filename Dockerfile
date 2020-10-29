# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrosario <mrosario@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/25 19:30:32 by mrosario          #+#    #+#              #
#    Updated: 2020/10/28 22:15:14 by mrosario         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update

#Install openrc
RUN apk add openrc

#Install nginx
RUN apk add nginx

#Configure nginx
COPY srcs/nginx.conf etc/nginx/
#RUN mkdir -p /run/nginx

RUN rm -rf /var/cache/apk/* 
CMD ["etc/init.d/nginx start"]