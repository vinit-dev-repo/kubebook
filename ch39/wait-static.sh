#!/bin/sh
# usage: sh wait-static.sh with|without WORD POD...
# waits until each static Pod lists (with) or lacks (without) WORD among its flags and is Ready
want=$1
word=$2
shift 2
for p in "$@"; do
  ok=no
  for i in $(seq 1 90); do
    line=$(kubectl -n kube-system get pod $p-$CP -o jsonpath='{.spec.containers[0].command}{" ready="}{.status.containerStatuses[0].ready}' 2>/dev/null) || line=""
    case "$line" in
      *"$word"*ready=true) [ "$want" = with ] && ok=yes ;;
      *ready=true) [ "$want" = without ] && ok=yes ;;
    esac
    [ $ok = yes ] && break
    sleep 2
  done
  [ $ok = yes ] || exit 1
done
