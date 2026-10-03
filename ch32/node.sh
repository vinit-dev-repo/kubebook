#!/bin/bash
# usage: bash node.sh ACTION ROLE   (ACTION: cordon, uncordon, drain or status; ROLE: cp or worker)
act=$1; role=$2
if [ "$role" = cp ]; then sel='node-role.kubernetes.io/control-plane'; else sel='!node-role.kubernetes.io/control-plane'; fi
n=$(kubectl get nodes -l "$sel" -o jsonpath='{.items[0].metadata.name}')
case "$act" in
  cordon) kubectl cordon "$n" > /dev/null ;;
  uncordon) kubectl uncordon "$n" > /dev/null ;;
  drain) kubectl drain "$n" --ignore-daemonsets > drain.log 2>&1; rc=$?; echo "drain rc $rc"; exit $rc ;;
  status) kubectl get node "$n" --no-headers | awk '{print $2}' ;;
esac
