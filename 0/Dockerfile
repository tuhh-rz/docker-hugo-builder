FROM debian:stable-slim

ARG VERSION=${VERSION}
ENV VERSION=$VERSION
RUN echo $VERSION

ARG DOWNLOAD=${DOWNLOAD}
ENV DOWNLOAD=$DOWNLOAD
RUN echo $DOWNLOAD

RUN apt-get update && apt-get upgrade
RUN apt-get install -y \
    lftp \
    jpegoptim \
    optipng \
    wget

RUN wget "${DOWNLOAD}" -O /tmp/download.deb
RUN dpkg -i /tmp/download.deb

RUN hugo --version
