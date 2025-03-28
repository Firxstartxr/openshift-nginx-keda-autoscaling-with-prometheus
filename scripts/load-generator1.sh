#!/bin/bash
echo "Starting load generator 1"
while true; do
  curl -s <URL> /dev/null
  echo "Load generator 1: Request sent"
  sleep 1
done