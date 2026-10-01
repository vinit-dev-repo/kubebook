#!/bin/sh
ID=$(docker exec kubebook-ch33-ex-control-plane crictl ps --name '^etcd$' -q | awk 'NR == 1')
docker exec kubebook-ch33-ex-control-plane crictl exec "$ID" etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key "$@"
