#!/bin/sh
# usage: sh all.sh ROLE COMMAND   (runs on aws, azure and gcp at the same time)
r=$1; shift
for c in aws azure gcp; do
  ( cmd=$(printf '%s' "$*" | sed "s/@CPIP@/$(cat ips/$c-cp-private)/g")
    sh on.sh $c $r "$cmd" > out-$c.txt 2>&1
    echo $? > run-rc-$c.txt ) &
done
wait
bad=0
for c in aws azure gcp; do
  sed "s/^/$c $r: /" out-$c.txt
  if [ "$(cat run-rc-$c.txt)" != 0 ]; then echo "$c $r: failed with exit code $(cat run-rc-$c.txt)"; bad=1; fi
done
exit $bad
