#!/bin/sh
# replaced.sh POD OLDUID: wait until POD exists with another uid and is ready (at most 240 s)
for i in $(seq 1 240); do
  uid=$(kubectl get pod $1 -o jsonpath='{.metadata.uid}' 2>/dev/null)
  ready=$(kubectl get pod $1 -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' 2>/dev/null)
  [ -n "$uid" ] && [ "$uid" != "$2" ] && [ "$ready" = "True" ] && break
  sleep 1
done
