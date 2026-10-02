#!/bin/sh
# usage: sh ev.sh 'JQ FILTER'
# runs jq inside the node over the JSON alerts in the log of the Falco container named in $P
printf '%s\n' "$1" > ev.jq
docker cp ev.jq $CP:/root/kubebook-ev.jq > /dev/null
kubectl -n kubebook-ch42-falco logs "$P" -c falco 2>/dev/null | { grep '^{' || true; } | docker exec -i $CP jq -rc -f /root/kubebook-ev.jq
