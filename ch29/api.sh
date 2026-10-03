#!/bin/sh
node=$1
shift
docker exec "kubebook-ch29-ha-$node" kubectl --kubeconfig /etc/kubernetes/admin.conf --server https://127.0.0.1:6443 "$@"
