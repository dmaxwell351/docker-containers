FROM node:8
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /

VOLUME ["/usr/src/app"]

ENTRYPOINT ["docker-entrypoint.sh"]
