#!/bin/bash
# usage: bash snap.sh   (control plane: an etcd snapshot into the data folder of the node)
E=$(kubectl -n kube-system get pods -l component=etcd -o jsonpath='{.items[0].metadata.name}')
kubectl -n kube-system exec "$E" -- etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /var/lib/etcd/kubebook-ch32-before-upgrade.db 2> /dev/null | grep '^Snapshot saved'
