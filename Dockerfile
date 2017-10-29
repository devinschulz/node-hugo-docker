FROM node:8.4.0-alpine
MAINTAINER Devin Schulz <devin@devinschulz.com>

ENV HUGO_VERSION 0.30.2
ENV HUGO_BINARY hugo_0.30.2_Linux-64bit

# Install Hugo and AWS CLI
RUN set -x && \
  apk add --update \
  wget \
  ca-certificates \
  python \
  py-pip && \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz && \
  tar -xzf ${HUGO_BINARY}.tar.gz && \
  rm -r ${HUGO_BINARY}.tar.gz && \
  mv hugo /usr/bin/hugo && \
  pip install --upgrade awscli && \
  apk del wget ca-certificates py-pip && \
  rm /var/cache/apk/*

CMD ['node']
