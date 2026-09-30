#!/bin/sh
# versions.sh SERVICE WANTED: ask SERVICE until the set of answers is WANTED (at most 60 rounds), then print the set
for round in $(seq 1 60); do
  got=$(kubectl exec kubebook-ch10-client -- sh -c 'for n in $(seq 1 20); do wget -qO- -T 2 http://$0/ 2>/dev/null || echo down; done' "$1" | sort -u | tr '\n' ' ' | sed 's/ *$//')
  [ "$got" = "$2" ] && break
  sleep 1
done
echo "$got"
