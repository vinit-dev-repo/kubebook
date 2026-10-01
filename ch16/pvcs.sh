#!/bin/sh
# pvcs.sh [FLAGS]: list the claims (for example with -n NAMESPACE), with the random id masked and the age left out
kubectl get pvc "$@" --no-headers -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,VOLUME:.spec.volumeName,CAPACITY:.status.capacity.storage,ACCESS:.spec.accessModes[0],CLASS:.spec.storageClassName | sed -E 's/pvc-[0-9a-f-]{36}/pvc-UUID/g' | awk '{print $1, $2, $3, $4, $5, $6}'
