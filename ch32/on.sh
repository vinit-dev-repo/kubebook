#!/bin/sh
# usage: sh on.sh CLOUD ROLE COMMAND   (ROLE is cp or worker)
c=$1; r=$2; shift 2
ssh -i id_kubebook -o UserKnownHostsFile=known_hosts -o StrictHostKeyChecking=yes -o BatchMode=yes -o ConnectTimeout=10 -o ServerAliveInterval=30 ubuntu@$(cat ips/$c-$r) "$@" < /dev/null
