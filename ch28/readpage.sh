#!/bin/sh
# readpage.sh WANT [PATH]: ask the web Service from the client Pod until the page holds WANT, then print it
for i in $(seq 1 60); do
  out=$(kubectl exec kubebook-ch28-client -- wget -qO- -T 5 "http://kubebook-ch28-web${2:-}" 2>/dev/null) && echo "$out" | grep -q "$1" && break
  sleep 1
done
echo "$out"
