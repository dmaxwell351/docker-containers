#!/bin/bash
set -eo pipefail

su ubuntu
mkdir -p ~/.ssh
cp /config/authorized_keys ~/.ssh/authorized_keys 2>/dev/null || :
chown -R ubuntu ~/.ssh ~/.ssh/authorized_keys 2>/dev/null || :
chmod 700 ~/.ssh 2>/dev/null || :
chmod 600 ~/.ssh/authorized_keys 2>/dev/null || :
su root

#/usr/sbin/sshd -D -E /config/auth.log
tail -f /dev/null
