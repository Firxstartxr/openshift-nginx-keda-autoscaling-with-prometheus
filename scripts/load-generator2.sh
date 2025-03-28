#!/bin/bash
echo "Starting load generator 2"
while true; do
  curl -s <URL> /dev/null
  echo "Load generator 2: Request sent"
  sleep 1
done