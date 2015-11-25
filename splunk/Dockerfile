### Dockerfile for splunk
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

RUN apt-get update -q && \
	apt-get install -y wget
	
RUN wget -O /splunk-6.3.1-f3e41e4b37b2-linux-2.6-amd64.deb "http://download.splunk.com/products/splunk/releases/6.3.1/splunk/linux/splunk-6.3.1-f3e41e4b37b2-linux-2.6-amd64.deb"

RUN dpkg -i /splunk-6.3.1-f3e41e4b37b2-linux-2.6-amd64.deb

### Configure Service Startup
COPY rc.local /etc/rc.local
RUN chmod a+x /etc/rc.local && \
    chown -R nobody:users /opt/splunk

EXPOSE 8000 8089 9997 514

VOLUME ["/opt/splunk/var", "/data", "/license"]

### END
### To make this a persistent container, you must map /opt/splunk/var of this container
### to a folder on your host machine.
###
