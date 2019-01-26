# FROM golang:1-alpine
FROM golang:1.8
MAINTAINER Darren Char i@charact3.com

# RUN apk update && apk add git make openssl wget && rm -rf /var/cache/apk/*

ARG ngrok_domain
ARG goos
ARG goarch
RUN wget -O build.sh https://raw.githubusercontent.com/charact3/qs-ngrok/master/docker/build.sh
RUN chmod 755 build.sh
RUN NGROK_DOMAIN=$ngrok_domain goos=$goos goarch=$goarch ./build.sh
