#!/bin/sh
# try.sh POD URL WANT: ask from the Pod until the first answer line equals WANT (at most 20 asks), then print it
for i in $(seq 1 20); do
  case "$2" in
    https:*) out=$( (kubectl exec -n kubebook-ch43-cil "$1" -- wget -q -T 5 --spider "$2" 2>&1 && echo reached) | grep -v 'certificate validation not implemented' || true) ;;
    *) out=$(kubectl exec -n kubebook-ch43-cil "$1" -- wget -q -T 3 -O - "$2" 2>&1 || true) ;;
  esac
  line=$(echo "$out" | awk 'NR == 1')
  [ "$line" = "$3" ] && break
  sleep 1
done
echo "$1 -> $line"
