### Dockerfile for hap-nodejs
FROM phusion/passenger-customizable:0.9.18
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

ENV HOME /root
ENV APP_DIR /home/app
ENV APP_ROOT /home/app/dist
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

CMD ["/sbin/my_init"]

# Add python
RUN /pd_build/utilities.sh
RUN /pd_build/python.sh
RUN /pd_build/nodejs.sh

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

# Update things
RUN apt-get update && \
    apt-get install -y libavahi-compat-libdnssd-dev

RUN git clone https://github.com/KhaosT/HAP-NodeJS.git && \
    cd HAP-NodeJS && \
	mv * /home/app/.

RUN cd /home/app && \
    npm install && \
	node BridgedCore.js
	
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

### END
