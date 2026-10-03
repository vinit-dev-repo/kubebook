#!/bin/bash
# prints role, status and version of the two nodes, after waiting until both are Ready
for i in $(seq 1 60); do
  [ "$(kubectl get nodes --no-headers | grep -c ' Ready')" = 2 ] && break
  sleep 5
done
kubectl get nodes -l node-role.kubernetes.io/control-plane --no-headers | awk '{print "control-plane", $2, $5}'
kubectl get nodes -l '!node-role.kubernetes.io/control-plane' --no-headers | awk '{print "worker", $2, $5}'
