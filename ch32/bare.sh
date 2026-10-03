#!/bin/bash
# a Pod with no controller makes drain refuse; the trap cleans up however the script ends
trap 'kubectl delete pod bare --now > /dev/null 2>&1; bash node.sh uncordon worker' EXIT
kubectl run bare --image=nginx:1.28 --restart=Never > /dev/null
kubectl wait --for=condition=Ready pod/bare --timeout=120s > /dev/null
rc=0
bash node.sh drain worker || rc=$?
echo "refused: $(grep -o -E 'declare no controller[^:]*' drain.log | awk 'NR == 1')"
echo "evicted Pods: $(grep -c evicted drain.log || true)"
echo "worker: $(bash node.sh status worker)"
exit $rc
