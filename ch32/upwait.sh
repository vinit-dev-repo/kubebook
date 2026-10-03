#!/bin/bash
# waits until both nodes are Ready at the new version, then prints them and the version of the API server
for i in $(seq 1 60); do
  [ "$(kubectl get nodes --no-headers | grep -c ' Ready.* v1.36.4$')" = 2 ] && break
  sleep 5
done
bash nodes.sh
kubectl version | grep -E '^Server Version'
