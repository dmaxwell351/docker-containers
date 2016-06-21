### Dockerfile for hap-nodejs
FROM phusion/baseimage:0.9.18
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

# Update and install things
RUN apt-get update && \
    apt-get install -y nodejs npm git-core libnss-mdns libavahi-compat-libdnssd-dev && \
	npm config set registry http://registry.npmjs.org/ && \
	npm install -g node-gyp

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
RUN git clone https://github.com/KhaosT/HAP-NodeJS.git && \
    cd HAP-NodeJS && \
	npm install && \
#	node BridgedCore.js

### END
