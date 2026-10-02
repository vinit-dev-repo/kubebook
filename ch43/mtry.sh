#!/bin/sh
# mtry.sh POD NAMESPACE WANT: ask web from the Pod until the first answer line equals WANT (at most 20 asks), then print it
for i in $(seq 1 20); do
  out=$(kubectl exec -n "$2" "$1" -c "$1" -- wget -q -T 4 -O - http://web.kubebook-ch43-mesh:8080/hostname 2>&1 || true)
  line=$(echo "$out" | awk 'NR == 1')
  [ "$line" = "$3" ] && break
  sleep 1
done
echo "$1 -> $line"
