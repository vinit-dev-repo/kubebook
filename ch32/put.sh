#!/bin/sh
# usage: sh put.sh FILE...   (copies the files to the home folder of ubuntu on all six machines)
for c in aws azure gcp; do
  for r in cp worker; do
    scp -q -i id_kubebook -o UserKnownHostsFile=known_hosts -o StrictHostKeyChecking=yes -o BatchMode=yes -o ConnectTimeout=10 "$@" ubuntu@$(cat ips/$c-$r):
  done
done
