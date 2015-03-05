#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /nginxconf/nginx.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  cp /etc/nginx/nginx-template.conf /nginxconf/nginx.conf
  echo "daemon off;" >> /nginxconf/nginx.conf
  chown nobody:users /nginxconf/nginx.conf
fi


