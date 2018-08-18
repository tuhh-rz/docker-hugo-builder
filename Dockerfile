FROM alpine:latest

MAINTAINER TS <ts@ambiweb.de>

RUN apk add --no-cache \
    curl \
    tar

ENV VERSION 0.47
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -l https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
