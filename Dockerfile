FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN \
  apt-get update && \
  apt-get -y install \
          jq \
          nano \
          htop \
          git \
          curl \
          apache2 && \
  rm /var/www/html/index.html && \
  rm -rf /var/lib/apt/lists/*
