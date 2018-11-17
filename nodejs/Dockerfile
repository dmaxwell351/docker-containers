FROM cloud9/ws-nodejs
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
    apt-get install -y openssh-server

RUN apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/bin/node

#RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh /

RUN curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash

#RUN echo "ubuntu:$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" | chpasswd
#RUN echo "ubuntu:ubuntu" | chpasswd

EXPOSE 22

VOLUME ["/config", "/home/ec2-user/environment/project"]

ENTRYPOINT ["docker-entrypoint.sh"]

### END
