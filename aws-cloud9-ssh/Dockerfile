FROM cloud9/ws-nodejs
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

RUN apt-get update && \
    apt-get install -y openssh-server

RUN apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/bin/node

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh /

EXPOSE 22

VOLUME ["/config", "/home/ec2-user/environment/project"]

ENTRYPOINT ["docker-entrypoint.sh"]
