#!/bin/bash
set -eo pipefail

usermod -u 99 root 2>/dev/null || :
groupmod -g 100 root 2>/dev/null || :

cd /usr/src/app

npm install --production
node start
