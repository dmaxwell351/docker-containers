### Dockerfile for phpipam
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

# Install required deb packages
RUN apt-get update && \ 
	apt-get install -y git php-pear php5-curl php5-mysql php5-json php5-gmp php5-mcrypt php5-ldap libgmp-dev && \
	rm -rf /var/lib/apt/lists/*

# Add scripts from php docker image
COPY docker-php-ext-install /usr/bin/
COPY docker-php-ext-enable /usr/bin/
COPY docker-php-ext-configure /usr/bin/
	
# Configure apache and required PHP modules 
RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-install mysqli && \
	docker-php-ext-install pdo_mysql && \
	docker-php-ext-install gettext && \ 
	ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && \
	docker-php-ext-configure gmp --with-gmp=/usr/include/x86_64-linux-gnu && \
	docker-php-ext-install gmp && \
	echo ". /etc/environment" >> /etc/apache2/envvars && \
	a2enmod rewrite

# Copy php config file
COPY php.ini /usr/local/etc/php/

# Copy phpipam sources to web dir
ADD https://github.com/phpipam/phpipam/archive/1.2_beta2.tar.gz /tmp/
RUN	tar -xzf /tmp/1.2_beta2.tar.gz -C /var/www/html/ --strip-components=1 

RUN sed -i \ 
	-e "s/\['host'\] = \"localhost\"/\['host'\] = \"mysql\"/" \ 
    -e "s/\['user'\] = \"phpipam\"/\['user'\] = \"root\"/" \ 
    -e "s/\['pass'\] = \"phpipamadmin\"/\['pass'\] = getenv(\"MYSQL_ENV_MYSQL_ROOT_PASSWORD\")/" \ 
	/var/www/html/config.php
	
EXPOSE 80

### END
