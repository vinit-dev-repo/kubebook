#!/bin/sh
# settle.sh NAME COUNT: wait until the StatefulSet NAME has exactly COUNT Pods and COUNT of them are ready (at most 240 s)
for i in $(seq 1 240); do
  [ "$(kubectl get pods -l app=$1 -o name | wc -l | tr -d ' ')" = "$2" ] && [ "$(kubectl get sts $1 -o jsonpath='{.status.readyReplicas}')" = "$2" ] && break
  sleep 1
done
