#!/bin/bash
# two nginx Pods and a Service, a client Pod that asks the Service, and the client Pod deleted again
kubectl create deployment web --image=nginx:1.28 --replicas=2 > /dev/null
kubectl expose deployment web --port=80 > /dev/null
kubectl wait --for=condition=Available deployment/web --timeout=180s > /dev/null
W=$(kubectl get nodes -l '!node-role.kubernetes.io/control-plane' -o jsonpath='{.items[0].metadata.name}')
C=$(kubectl get nodes -l node-role.kubernetes.io/control-plane -o jsonpath='{.items[0].metadata.name}')
echo "web Pods on the worker: $(kubectl get pods -l app=web --field-selector spec.nodeName=$W --no-headers 2> /dev/null | wc -l)"
echo "web Pods on the control plane: $(kubectl get pods -l app=web --field-selector spec.nodeName=$C --no-headers 2> /dev/null | wc -l)"
kubectl run probe --image=busybox:1.37 --restart=Never -- sleep 3600 > /dev/null
kubectl wait --for=condition=Ready pod/probe --timeout=120s > /dev/null
for i in $(seq 1 30); do
  out=$(kubectl exec probe -- wget -qO- -T 5 http://web 2> /dev/null | grep -o '<title>[^<]*</title>') && [ -n "$out" ] && break
  sleep 3
done
echo "the Service answers: $out"
kubectl delete pod probe --now > /dev/null
echo "client Pods left: $(kubectl get pods -l run=probe --no-headers 2> /dev/null | wc -l)"
