#!/bin/sh
# enc.sh CLUSTER: web on the worker, far on the control plane, and where each one runs
kubectl create namespace kubebook-ch43-enc > /dev/null
for i in $(seq 1 30); do kubectl get sa default -n kubebook-ch43-enc > /dev/null 2>&1 && break; sleep 1; done
sed "s/CLUSTER/$1/" enc.yaml | kubectl apply -f - > /dev/null
kubectl -n kubebook-ch43-enc wait --for=condition=Ready pod/web pod/far --timeout=180s > /dev/null
kubectl -n kubebook-ch43-enc get pods --sort-by=.metadata.name -o custom-columns=NAME:.metadata.name,NODE:.spec.nodeName --no-headers | sed -E "s/$1-//; s/  +/ /"
