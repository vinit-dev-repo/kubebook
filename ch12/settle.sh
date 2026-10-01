#!/bin/sh
# settle.sh COUNT: wait until the DaemonSet has COUNT Pods, all ready and all from the newest template (at most 180 s)
for i in $(seq 1 180); do
  [ "$(kubectl get ds kubebook-ch12-agent -o jsonpath='{.status.desiredNumberScheduled}')" = "$1" ] && [ "$(kubectl get ds kubebook-ch12-agent -o jsonpath='{.status.numberReady}')" = "$1" ] && [ "$(kubectl get ds kubebook-ch12-agent -o jsonpath='{.status.updatedNumberScheduled}')" = "$1" ] && [ "$(kubectl get pods -l app=kubebook-ch12-agent -o name | wc -l | tr -d ' ')" = "$1" ] && break
  sleep 1
done
