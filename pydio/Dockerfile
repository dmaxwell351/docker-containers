### Dockerfile for Pydio
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

# Install wget
RUN \
  apt-get update && \
  apt-get install -y wget

  # Add Pydio repo
RUN echo "deb http://dl.ajaxplorer.info/repos/apt stable main" >> /etc/apt/sources.list
RUN echo "deb-src http://dl.ajaxplorer.info/repos/apt stable main" >> /etc/apt/sources.list

RUN \
  wget  http://dl.ajaxplorer.info/repos/charles@ajaxplorer.info.gpg.key && \
  apt-key add charles@ajaxplorer.info.gpg.key

RUN \
  apt-get update && \
  apt-get install -y pydio && \
  apt-get install -y php5-sqlite && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
  
RUN cp /usr/share/doc/pydio/apache2.sample.conf /etc/apache2/sites-available/pydio.conf
RUN \
  a2ensite pydio && \
  a2enmod rewrite && \
  php5enmod mcrypt && \
  php5enmod sqlite3 && \
  service apache2 restart

RUN \
  mkdir -p /pydio && \
  chmod 777 /pydio && \
  chown nobody:users /pydio && \
  cp -Rn /usr/share/pydio/* /pydio/. && \
  rm -R /usr/share/pydio && \
  ln -s /pydio /usr/share/pydio

RUN \
  mkdir -p /data && \
  chmod 777 /data && \
  chown nobody:users /data && \
  cp -Rn /usr/share/pydio/data/* /data/. && \
  rm -R /usr/share/pydio/data && \
  ln -s /data /usr/share/pydio/data

RUN \
  mkdir -p /database && \
  chmod 777 /database && \
  chown nobody:users /database
ADD pydio.db /pydio.db
RUN cp -n /pydio.db /database/pydio.db

ADD .htaccess /.htaccess
RUN cp -n /.htaccess /pydio/.htaccess

VOLUME ["/pydio", "/database", "/data"]

EXPOSE 80
EXPOSE 443

### END