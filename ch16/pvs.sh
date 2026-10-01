#!/bin/sh
# pvs.sh: list the PersistentVolumes, with the random id masked and the age left out
for i in $(seq 1 30); do
  kubectl get pv -o jsonpath='{range .items[*]}{.metadata.name}={.status.phase}{"\n"}{end}' | grep '=Pending$' > /dev/null || break
  sleep 1
done
kubectl get pv --no-headers | sed -E 's/pvc-[0-9a-f-]{36}/pvc-UUID/g' | awk '{print $1, $2, $3, $4, $5, $6, $7}' | sed 's/ *$//'
