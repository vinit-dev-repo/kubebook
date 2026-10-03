#!/bin/sh
# kubectl kubebook-pods: the Pods of the current namespace, with their phase
if [ "${1:-}" = "version" ]; then echo "kubebook-pods 1.0"; exit 0; fi
kubectl get pods --no-headers -o custom-columns=NAME:.metadata.name,PHASE:.status.phase "$@"
