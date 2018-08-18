FROM alpine:latest

MAINTAINER TS <ts@ambiweb.de>

RUN apk add --no-cache \
    tar

ENV VERSION 0.47

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_Linux-64bit.tar.gz /usr/local/src
    
RUN tar -xfz ${HUGO_ID}_Linux-64bit.tar.gz
RUN mv hugo /usr/local/bin/hugo \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
