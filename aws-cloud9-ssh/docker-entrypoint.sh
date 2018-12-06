#!/bin/bash
set -eo pipefail

usermod -u 99 ubuntu 2>/dev/null || :
curl -o /home/ubuntu/install.sh -L https://raw.githubusercontent.com/c9/install/master/install.sh 2>/dev/null || :
su ubuntu -c 'bash ~/install.sh' 2>/dev/null || :

mkdir -p /home/ubuntu/.ssh 2>/dev/null || :
cp /config/authorized_keys /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :
chown -R ubuntu:ubuntu /home/ubuntu/.ssh /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :
chmod 700 /home/ubuntu/.ssh 2>/dev/null || :
chmod 600 /home/ubuntu/.ssh/authorized_keys 2>/dev/null || :

/usr/sbin/sshd -D
