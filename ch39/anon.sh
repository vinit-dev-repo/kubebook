#!/bin/sh
# usage: sh anon.sh PATH WANTED
# asks the API server for PATH with no credentials until the answer is WANTED (60 tries), then prints "CODE PATH"
for i in $(seq 1 60); do
  code=$(curl -sk -o anon.txt -w '%{http_code}' "$SERVER$1") || code=000
  [ "$code" = "$2" ] && break
  sleep 2
done
echo "$code $1"
