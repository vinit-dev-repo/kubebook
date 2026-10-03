#!/bin/sh
# usage: sh wait-kubelet.sh with|without WORD
# waits until the kubelet's live settings have (with) or lack (without) WORD
for i in $(seq 1 90); do
  conf=$(kubectl get --raw "/api/v1/nodes/$CP/proxy/configz" 2>/dev/null) || conf=""
  if [ -n "$conf" ]; then
    case "$conf" in
      *"$2"*) [ "$1" = with ] && exit 0 ;;
      *) [ "$1" = without ] && exit 0 ;;
    esac
  fi
  sleep 2
done
exit 1
