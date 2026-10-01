#!/bin/sh
# check.sh SERVICE: the first four checks of the Debug Services page, run from the client Pod
svc=$1
kubectl get svc "$svc" > /dev/null 2>&1 && echo "exists: yes" || echo "exists: no"
echo "ready endpoints: $(kubectl get endpointslices -l kubernetes.io/service-name=$svc -o jsonpath='{range .items[*].endpoints[*]}{.conditions.ready}{"\n"}{end}' | grep -c true || true)"
kubectl exec kubebook-ch17-client -- wget -qO- -T 3 "http://$svc" > /dev/null 2>&1 && echo "by name: ok" || echo "by name: FAIL"
ip=$(kubectl get svc "$svc" -o jsonpath='{.spec.clusterIP}')
kubectl exec kubebook-ch17-client -- wget -qO- -T 3 "http://$ip" > /dev/null 2>&1 && echo "by cluster IP: ok" || echo "by cluster IP: FAIL"
