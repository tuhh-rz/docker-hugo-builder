FROM debian:stable-slim

ARG VERSION=${VERSION}
ENV VERSION=$VERSION
RUN echo $VERSION

ARG DOWNLOAD=${DOWNLOAD}
ENV DOWNLOAD=$DOWNLOAD
RUN echo $DOWNLOAD

RUN apt-get update && apt-get upgrade
RUN apt-get install -y lftp jpegoptim optipng

RUN wget "${DOWNLOAD}" -O /tmp/download.tar.gz
RUN tar xf /tmp/download.tar.gz -C /tmp && rm /tmp/download.tar.gz

RUN mv /tmp/hugo /usr/bin/hugo && hugo --version
