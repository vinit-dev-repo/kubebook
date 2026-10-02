#!/bin/sh
# usage: sh wait-apiserver.sh with|without WORD
# waits until the API server answers and its Pod lists (with) or lacks (without) WORD among its flags
for i in $(seq 1 90); do
  flags=$(kubectl -n kube-system get pod kube-apiserver-$CP -o jsonpath='{.spec.containers[0].command}' 2>/dev/null) || flags=""
  if [ -n "$flags" ] && kubectl get --raw /readyz > /dev/null 2>&1; then
    case "$flags" in
      *"$2"*) [ "$1" = with ] && exit 0 ;;
      *) [ "$1" = without ] && exit 0 ;;
    esac
  fi
  sleep 2
done
exit 1
