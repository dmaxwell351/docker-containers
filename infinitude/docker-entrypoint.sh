#!/bin/bash

echo "{\"app_secret\":\"$APP_SECRET\",\"pass_reqs\":$PASS_REQS,\"serial_tty\":\"/dev/ttyUSB0\"}" > /infinitude/infinitude.json

cd /infinitude && ./infinitude daemon -m Production
