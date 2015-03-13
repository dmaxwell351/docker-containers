#!/bin/sh
exec /sbin/setuser nobody /AirVideoServerHD --config=/config/server.properties >> /var/log/airvideohd.log 2>&1