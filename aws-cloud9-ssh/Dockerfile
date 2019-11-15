FROM cloud9/workspace
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

#RUN apt update && \
#    apt install -y openssh-server

RUN rm /etc/apt/sources.list.d/mongodb*.list
RUN apt-get update
RUN apt-get install -y openssh-server

#RUN apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/bin/node

RUN echo "ubuntu:$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" | chpasswd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh /

EXPOSE 22

VOLUME ["/config", "/home/ec2-user/environment/project"]

ENTRYPOINT ["docker-entrypoint.sh"]
