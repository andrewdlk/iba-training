#!/bin/bash
set -o errexit
set -o nounset
yourname=$(whoami)
while true; do
  echo "Mr.(s) $yourname. This service show you date and time on your OS: "$(date)""
  sleep 10
done
