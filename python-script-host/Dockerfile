### Dockerfile for python-script-host
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

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx inotify-tools && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  cp /etc/nginx/nginx.conf /etc/nginx/nginx-template.conf  && \
  rm /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/var/www/Codiad/pythonhost"]

# Set config.js to under config
RUN ln -s /nginxconf/nginx.conf /etc/nginx/nginx.conf

# Expose ports.
EXPOSE 80 443

# Clone Codiad
RUN cd /var/www && \
	git clone https://github.com/Codiad/Codiad.git && \
	mkdir -p /var/www/Codiad/pythonhost

# Copy over default nginx config for Codiad
COPY default /etc/nginx/sites-enabled/default

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add inotify.sh to execute during container startup
RUN mkdir /etc/service/inotify
ADD inotify.sh /etc/service/inotify/run
RUN chmod +x /etc/service/inotify/run

# Add nginx to runit
RUN mkdir /etc/service/nginx
ADD nginx-run.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run
ADD nginx-finish.sh /etc/service/nginx/finish
RUN chmod +x /etc/service/nginx/finish

