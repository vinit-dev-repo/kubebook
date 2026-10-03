#!/bin/bash
# cordon the worker, add a third web Pod, and show that the old Pods stay and the new one waits
bash node.sh cordon worker
echo "worker: $(bash node.sh status worker)"
kubectl scale deployment web --replicas=3 > /dev/null
for i in $(seq 1 30); do [ "$(kubectl get pods -l app=web --no-headers | wc -l)" = 3 ] && break; sleep 1; done
kubectl get pods -l app=web --no-headers | awk '{print $3}' | sort | uniq -c | awk '{print $1, $2}'
bash node.sh uncordon worker
echo "after the uncordon: $(bash webwait.sh 3)"
kubectl scale deployment web --replicas=2 > /dev/null
for i in $(seq 1 60); do [ "$(kubectl get pods -l app=web --no-headers | wc -l)" = 2 ] && break; sleep 2; done
echo "back to: $(bash webwait.sh 2)"
