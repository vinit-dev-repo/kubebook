#!/bin/sh
# why.sh POD [NAMESPACE]: wait (at most 60 s) for the FailedScheduling event of POD, then print the Pod's status and the first message, cut before "preemption:"
NS=${2:-default}
for i in $(seq 1 60); do
  kubectl get events -n $NS --field-selector involvedObject.name=$1,reason=FailedScheduling -o name | grep . > /dev/null && break
  sleep 1
done
kubectl get pod $1 -n $NS --no-headers | awk '{print $1, $3}'
kubectl get events -n $NS --field-selector involvedObject.name=$1,reason=FailedScheduling -o jsonpath='{range .items[*]}{.message}{"\n"}{end}' | awk 'NR == 1' | sed -E 's/ (no new claims to deallocate, )?preemption: .*//'
