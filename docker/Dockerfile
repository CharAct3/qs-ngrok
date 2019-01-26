FROM golang:1-alpine
MAINTAINER Darren Char i@charact3.com

RUN apk update && \
    apk add git make openssl wget && \
    rm -rf /var/cache/apk/*

ARG ngrok_domain
ARG goos
ARG goarch
RUN wget -O build.sh https://raw.githubusercontent.com/charact3/qs-ngrok/master/docker/build.sh
RUN NGROK_DOMAIN=$ngrok_domain GOOS=goos GOARCH=goarch source build.sh
