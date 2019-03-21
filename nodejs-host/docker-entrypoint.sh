#!/bin/bash
set -eo pipefail

#usermod -u 99 root
#groupmod -g 102 users
#groupmod -g 100 root

cd /usr/src/app

npm install
npm start
