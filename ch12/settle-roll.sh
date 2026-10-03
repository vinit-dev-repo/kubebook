#!/bin/sh
# settle-roll.sh: wait until the DaemonSet kubebook-ch12-roll has 3 ready Pods, all from the newest template (at most 180 s)
for i in $(seq 1 180); do
  [ "$(kubectl get ds kubebook-ch12-roll -o jsonpath='{.status.numberReady}')" = 3 ] && [ "$(kubectl get ds kubebook-ch12-roll -o jsonpath='{.status.updatedNumberScheduled}')" = 3 ] && [ "$(kubectl get pods -l app=kubebook-ch12-roll -o name | wc -l | tr -d ' ')" = 3 ] && break
  sleep 1
done
