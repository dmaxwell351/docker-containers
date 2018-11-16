FROM ubuntu:latest
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

# Update and install things
RUN apt-get update && \
    apt-get install -y python-software-properties python nodejs npm git-core openssh-server

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/sshd
RUN cp /root/auth/authorized_keys /root/.ssh/authorized_keys
RUN rm -f /root/auth
RUN chmod 700 /root/.ssh
RUN chmod 400 /root/.ssh/authorized_keys
RUN chown root. /root/.ssh/authorized_keys
CMD /usr/sbin/sshd -D

EXPOSE 22

### END
