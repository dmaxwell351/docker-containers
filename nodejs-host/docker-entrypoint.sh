#!/bin/bash
set -eo pipefail

cd /usr/src/app

npm install --production
node start
