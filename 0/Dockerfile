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
    optipng

# Hilfreich waehrend der Nutzung des Containers
RUN apt-get install -qy \
    openssh-client \
    wget

RUN wget "${DOWNLOAD}" -O /tmp/download.deb
RUN dpkg -i /tmp/download.deb && rm /tmp/download.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN hugo version

LABEL \
    de.tuhh.ci_repository_url=$CI_REPOSITORY_URL \
    de.tuhh.ci_commit_short_sha=$CI_COMMIT_SHORT_SHA \
    de.tuhh.build-date=$BUILD_DATE \
    de.tuhh.version=$VERSION
