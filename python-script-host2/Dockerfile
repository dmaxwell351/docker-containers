### Dockerfile for python-script-host2
FROM phusion/passenger-customizable:<VERSION>
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

CMD ["/sbin/my_init"]

#   Build system and git.
RUN /pd_build/utilities.sh
#   Python support.
RUN /pd_build/python.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Copy files
COPY pip /pip
COPY easy_install /easy_install
COPY distutils /distutils
COPY projects /projects

### Configure Service Startup
COPY rc.local /etc/rc.local
RUN chmod a+x /etc/rc.local

RUN mkdir /etc/service/python-script-host
ADD python-script-host.sh /etc/service/python-script-host/run

VOLUME ["/config", "/projects"]

### END
