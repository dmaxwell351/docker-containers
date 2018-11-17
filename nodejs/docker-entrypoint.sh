#!/bin/bash
set -eo pipefail

mkdir -p ~/.ssh
cp /config/authorized_keys ~/.ssh/authorized_keys 2>/dev/null || :
chown -R root ~/.ssh ~/.ssh/authorized_keys 2>/dev/null || :
chmod 700 ~/.ssh 2>/dev/null || :
chmod 600 ~/.ssh/authorized_keys 2>/dev/null || :
/usr/sbin/sshd -D
