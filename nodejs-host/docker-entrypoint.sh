#!/bin/bash
set -eo pipefail

npm install --production

node index.js
