### Dockerfile for websync
FROM phusion/baseimage:0.9.16
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install requirements
RUN \
  apt-get update && \
  apt-get install -y git, nodejs, sshpass && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd ~ && \
  git clone https://github.com/furier/websync.git && \
  cd websync && \
  npm install && \
  npm install -g bower && \
  bower install

RUN \
  cd ~/dist && \
  node server.js

VOLUME ["/unRAID", "/config"]

EXPOSE 3000

### END