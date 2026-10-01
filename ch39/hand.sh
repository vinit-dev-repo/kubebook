#!/bin/sh
# usage: sh hand.sh ARG...
# runs etcdctl against the etcd that this chapter started by hand, with the client certificate
docker exec $CP etcdctl --endpoints https://127.0.0.1:12379 --cacert /root/kubebook-ch39-etcd-pki/ca.crt --cert /root/kubebook-ch39-etcd-pki/client.crt --key /root/kubebook-ch39-etcd-pki/client.key "$@"
