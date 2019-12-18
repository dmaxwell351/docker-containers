FROM ubuntu:latest
MAINTAINER dmaxwell351 <dmaxwell351@sent.com>

RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

RUN apt-get update && apt-get -y upgrade \
	&& apt-get install -y git build-essential cpanminus libchi-perl libmojolicious-perl libdatetime-perl libxml-simple-perl libmoo-perl libjson-maybexs-perl libhash-asobject-perl libdata-parsebinary-perl libdigest-crc-perl libcache-perl libtest-longstring-perl libio-pty-perl \
	&& git clone https://github.com/nebulous/infinitude.git /infinitude \ 
    && chmod +x /infinitude/infinitude \
    && cd /infinitude \
    && cpanm Mojolicious::Lite CHI DateTime Try::Tiny Path::Tiny JSON IO::Termios

COPY entrypoint.sh /usr/local/bin/

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
