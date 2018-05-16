FROM node:alpine
MAINTAINER Larryzhang <zhangyang@jingfree.com>
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk update
RUN apk --no-cache add git lynx xdg-utils yarn
RUN npm config set registry https://registry.npm.taobao.org
RUN npm config set unsafe-perm true
RUN npm install -g gulp jshint
RUN npm install -g nodemon
#RUN npm install -g pm2
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app










