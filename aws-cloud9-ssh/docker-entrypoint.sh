#!/bin/bash
set -eo pipefail

mkdir -p /home/ubuntu/.ssh
cp /config/authorized_keys /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :
chown -R ubuntu:ubuntu /home/ubuntu/.ssh /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :
chmod 700 /home/ubuntu/.ssh 2>/dev/null || :
chmod 600 /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :

/usr/sbin/sshd -D
