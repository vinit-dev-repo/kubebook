#!/bin/sh
# usage: sh wait-flag.sh NODE COMPONENT TEXT with|without
# waits until the API server answers and the Pod COMPONENT-NODE lists (with) or lacks (without) TEXT in its command
for i in $(seq 1 90); do
  cmd=$(kubectl -n kube-system get pod "$2-$1" -o jsonpath='{.spec.containers[0].command}' 2>/dev/null) || cmd=""
  if [ -n "$cmd" ] && kubectl get --raw /readyz > /dev/null 2>&1; then
    case "$cmd" in
      *"$3"*) [ "$4" = with ] && exit 0 ;;
      *) [ "$4" = without ] && exit 0 ;;
    esac
  fi
  sleep 2
done
exit 1
