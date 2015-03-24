#!/bin/sh
exec /sbin/setuser nobody node ~/websync/dist/server.js >> /var/log/websync.log 2>&1