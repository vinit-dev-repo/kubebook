#!/bin/bash
# usage: bash webwait.sh N   (waits until the Deployment web has N ready Pods, then prints it)
for i in $(seq 1 60); do [ "$(kubectl get deployment web -o custom-columns=R:.status.readyReplicas --no-headers)" = "$1" ] && break; sleep 2; done
kubectl get deployment web --no-headers | awk '{print $1, $2}'
