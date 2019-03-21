#!/bin/bash
set -eo pipefail

cd /home/nodejs/app

npm install --production
node index.js
