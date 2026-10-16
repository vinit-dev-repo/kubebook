#!/bin/sh
set -eu
case "$JOB_COMPLETION_INDEX" in 0|1|2) ;; *) exit 2 ;; esac
mkdir /tmp/http
pages=$(awk -v partition="$JOB_COMPLETION_INDEX" 'int((NR-1)/2)==partition { total += $2 } END { print total }' /app/seed.txt)
printf 'index=%s pages=%s\n' "$JOB_COMPLETION_INDEX" "$pages" > /tmp/http/identity
httpd -p 8080 -h /tmp/http
peer=$(((JOB_COMPLETION_INDEX + 1) % 3))
address="kubebook-ch17-peers-$peer.kubebook-ch17-scan-peers.kubebook-ch17-job-patterns.svc.cluster.local"
case "$peer" in 0) expected=20 ;; 1) expected=22 ;; 2) expected=12 ;; esac
response=''
for attempt in $(seq 1 120); do
  response=$(wget -qO- -T 2 "http://$address:8080/identity" 2>/dev/null) || response=''
  test "$response" = "index=$peer pages=$expected" && break
  sleep 1
done
test "$response" = "index=$peer pages=$expected"
printf 'worker=%s peer=%s pages=%s\n' "$JOB_COMPLETION_INDEX" "$peer" "$expected"
touch /tmp/exchanged
for attempt in $(seq 1 600); do
  test -f /tmp/release && break
  sleep 1
done
test -f /tmp/release
