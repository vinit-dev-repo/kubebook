#!/bin/sh
# reads a Secret straight from etcd with the health-check client certificate, over the etcd v3 HTTP API
key=$(printf '/registry/secrets/kubebook-ch39-bypass/s2' | base64 -w0)
curl -s --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/healthcheck-client.crt --key /etc/kubernetes/pki/etcd/healthcheck-client.key -X POST -d "{\"key\":\"$key\"}" https://127.0.0.1:2379/v3/kv/range > /root/kubebook-range.json
echo "the made-up value is readable from etcd: $(grep -o '"value":"[^"]*"' /root/kubebook-range.json | cut -d'"' -f4 | base64 -d | grep -a -c kubebook-not-a-real-one-2)"
openssl x509 -in /etc/kubernetes/pki/etcd/healthcheck-client.crt -noout -subject
rm -f /root/kubebook-range.json
