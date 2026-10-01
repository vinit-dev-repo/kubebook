#!/bin/sh
# ex-count.sh N: wait until the DaemonSet edge has exactly N Pods and all of them run (at most 120 s)
for i in $(seq 1 120); do
  [ "$(kubectl get pods -n kubebook-ch12-ex -l app=edge -o name | wc -l | tr -d ' ')" = "$1" ] && [ "$(kubectl get pods -n kubebook-ch12-ex -l app=edge --field-selector status.phase=Running -o name | wc -l | tr -d ' ')" = "$1" ] && break
  sleep 1
done
