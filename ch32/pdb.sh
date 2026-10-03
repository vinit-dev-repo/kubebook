#!/bin/bash
# a PodDisruptionBudget of 2 for web, a drain of the worker with a 30 second limit, and the cleanup
trap 'kubectl delete pdb web --ignore-not-found > /dev/null 2>&1; bash node.sh uncordon worker' EXIT
kubectl create poddisruptionbudget web --selector=app=web --min-available=2 > /dev/null
W=$(kubectl get nodes -l '!node-role.kubernetes.io/control-plane' -o jsonpath='{.items[0].metadata.name}')
rc=0
kubectl drain "$W" --ignore-daemonsets --timeout=30s > pdb.log 2>&1 || rc=$?
echo "drain rc $rc"
echo "$(grep -o "Cannot evict pod as it would violate the pod's disruption budget" pdb.log | awk 'NR == 1')"
echo "web Pods: $(kubectl get pods -l app=web --no-headers | awk '{print $3}' | sort | uniq -c | awk '{print $1, $2}')"
exit $rc
