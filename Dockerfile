FROM busybox:1.29.2-glibc

MAINTAINER TS <ts@ambiweb.de>

ENV HUGO_VERSION=0.47
ENV HUGO_TYPE=_extended
ENV HUGO_ID=hugo${HUGO_TYPE}_${HUGO_VERSION}

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN ["/hugo", "version"]

RUN /hugo /bin/hugo \
    && rm -rf /hugo.tar.gz \
    && rm -rf /LICENSE.md \
    && rm -rf /README.md

WORKDIR /src

EXPOSE 1313
