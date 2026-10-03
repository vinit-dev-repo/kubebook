#!/bin/sh
# zonecount.sh APP: print how many Pods of APP run in each zone
for n in $(kubectl get pods -l app=$1 --field-selector status.phase=Running -o jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}{end}'); do
  kubectl get node $n -L kubebook-ch14-zone --no-headers | awk '{print "zone " $6}'
done | LC_ALL=C sort | uniq -c | sed -E 's/^ +//'
