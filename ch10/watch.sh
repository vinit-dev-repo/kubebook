#!/bin/sh
# watch.sh LOG COUNT PAUSE: ask the Service COUNT times, PAUSE seconds apart, and write each answer to LOG
kubectl exec kubebook-ch10-client -- sh -c 'for n in $(seq 1 $0); do wget -qO- -T 3 http://kubebook-ch10-web/ 2>/dev/null || echo down; sleep $1; done' "$2" "$3" > "$1"
