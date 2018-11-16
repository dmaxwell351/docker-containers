#!/bin/bash
set -eo pipefail

mkdir -p /root/.ssh
cp /config/authorized_keys /root/.ssh/authorized_keys 2>/dev/null || :
chmod 700 /root/.ssh
chmod 400 /root/.ssh/authorized_keys 2>/dev/null || :
chown root. /root/.ssh/authorized_keys 2>/dev/null || :
/usr/sbin/sshd -D
