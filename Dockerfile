FROM node:8.4.0-alpine
MAINTAINER Devin Schulz <devin@devinschulz.com>

ENV HUGO_VERSION 0.26
ENV HUGO_BINARY hugo_0.26_Linux-64bit

# Install Hugo and Python pygments for syntax highlighting
RUN set -x && \
  apk add --update wget ca-certificates py-pygments && \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz && \
  tar -xzf ${HUGO_BINARY}.tar.gz && \
  rm -r ${HUGO_BINARY}.tar.gz && \
  mv hugo /usr/bin/hugo && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

CMD ['node']
