#!/bin/bash
# reads what a drain of the worker did
echo "evicted web Pods: $(grep -c '^pod/web-.* evicted' drain.log)"
echo "DaemonSet Pods: $(grep -io 'ignoring DaemonSet-managed Pods' drain.log | awk 'NR == 1')"
echo "worker: $(bash node.sh status worker)"
for i in $(seq 1 60); do [ "$(kubectl get pods -l app=web --no-headers | grep -c Pending)" = 2 ] && break; sleep 2; done
echo "web Pods: $(kubectl get pods -l app=web --no-headers | awk '{print $3}' | sort | uniq -c | awk '{print $1, $2}')"
echo "Deployment: $(kubectl get deployment web --no-headers | awk '{print $1, $2}')"
echo "why: $(kubectl get pods -l app=web -o jsonpath='{.items[0].status.conditions[?(@.type=="PodScheduled")].message}' | grep -oE 'had untolerated taint|were unschedulable' | sort -u | paste -sd,)"
