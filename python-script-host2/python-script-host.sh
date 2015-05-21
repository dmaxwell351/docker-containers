#!/bin/sh
while read -r line
do
	f=$line
	exec /sbin/setuser nobody python $f >> /var/log/python-script-host.log 2>&1
done < /config/projects
