#!/bin/sh
# chain.sh SERVICE LABEL PORT: follow the chain from the user to the container, one link at a time
svc=$1
expect=$2
port=$3
client=kubebook-ch34-client
if kubectl exec $client -- wget -qO- -T 3 "http://$svc/" > /dev/null 2>&1; then echo "1 a request to the Service: ok"; else echo "1 a request to the Service: FAILED"; fi
sel=$(kubectl describe service "$svc" | awk '/^Selector:/ {print $2}')
echo "2 Pods found by the Service selector: $(kubectl get pods -l "$sel" --no-headers 2> /dev/null | wc -l | tr -d ' ')"
echo "3 ready endpoints in the slice: $(kubectl get endpointslices -l kubernetes.io/service-name=$svc -o jsonpath='{range .items[*].endpoints[*]}{.conditions.ready}{"\n"}{end}' | grep -c true || true)"
echo "4 Pods ready with the label $expect: $(kubectl get pods -l "$expect" -o jsonpath='{range .items[*]}{.status.containerStatuses[*].ready}{"\n"}{end}' | grep -c true || true)"
echo "5 the Service sends to port: $(kubectl get service "$svc" -o jsonpath='{.spec.ports[0].targetPort}')"
ip=$(kubectl get pods -l "$expect" --field-selector=status.phase=Running -o jsonpath='{.items[*].status.podIP}' | awk '{print $1}')
if [ -n "$ip" ] && kubectl exec $client -- wget -qO- -T 3 "http://$ip:$port/" > /dev/null 2>&1; then echo "6 a request to a Pod on port $port: ok"; else echo "6 a request to a Pod on port $port: FAILED"; fi
