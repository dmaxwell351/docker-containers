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

# Install Dependencies
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"

RUN \
  apt-get update -qq && \
  apt-get install -qy git nodejs npm sshpass

RUN \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd ~ && \
  git clone https://github.com/furier/websync.git

#RUN \
#  cd ~/websync && \
#  npm install

#RUN \
#  cd ~/websync && \
#  npm install -g bower

#RUN \
#  cd ~/websync && \
#  bower install

RUN mkdir /etc/service/websync
ADD websync.sh /etc/service/websync/run

VOLUME ["/unRAID", "/config"]

EXPOSE 3000

### END