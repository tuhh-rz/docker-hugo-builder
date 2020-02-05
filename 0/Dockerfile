FROM debian:stable-slim

ARG VERSION=${VERSION}
ENV VERSION=$VERSION
RUN echo $VERSION

ARG DOWNLOAD=${DOWNLOAD}
ENV DOWNLOAD=$DOWNLOAD
RUN echo $DOWNLOAD

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -qy

RUN apt-get install -qy \
    lftp \
    jpegoptim \
    optipng \
    wget

RUN wget "${DOWNLOAD}" -O /tmp/download.deb
RUN dpkg -i /tmp/download.deb && rm /tmp/download.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN hugo --version
