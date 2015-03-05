#!/bin/sh

while inotifywait -e modify /nginxconf; do
    sv down /etc/service/nginx/
    sv up /etc/service/nginx/
    echo "File in Config Folder Changed, Restarted"
done
