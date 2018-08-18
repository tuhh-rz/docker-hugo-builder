FROM alpine:3.8

MAINTAINER TS <ts@ambiweb.de>
ENV HUGO_VERSION=0.47

RUN apk add --update --no-cache --virtual build-dependencies

RUN apk add --update --no-cache \
		bash \
		build-base \
		ca-certificates \
		curl \
		git \
		libcurl \
# Needed for Hugo Extended which uses CGO
		libc6-compat \
		libxml2-dev \
		libxslt-dev \
		openssh \
		rsync \
	gem install \
		html-proofer \
		nokogiri \
	--no-document && \
	apk del build-dependencies && \
	rm /var/cache/apk/*

# Install HUGO

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp

RUN tar -xf /tmp/${HUGO_ID}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo \
    && rm -rf /tmp/${HUGO_ID}_Linux-64bit.tar.gz \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

WORKDIR /src

EXPOSE 1313
