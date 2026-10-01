#!/bin/sh
mkdir -p /var/lib/kubebook-ch39-etcd-plain
timeout 8 etcd --name kubebook-ch39-plain --data-dir /var/lib/kubebook-ch39-etcd-plain --listen-client-urls http://127.0.0.1:12389 --advertise-client-urls http://127.0.0.1:12389 --listen-peer-urls http://127.0.0.1:12390 > /root/kubebook-ch39-plain.log 2>&1 &
pid=$!
for i in $(seq 1 20); do etcdctl --endpoints http://127.0.0.1:12389 put kubebook-key kubebook-value 2>/dev/null && break; sleep 1; done
etcdctl --endpoints http://127.0.0.1:12389 get kubebook-key
curl -s http://127.0.0.1:12389/version
echo
grep -m1 -o '"msg":"[^"]*insecurely[^"]*"' /root/kubebook-ch39-plain.log
wait $pid || true
rm -rf /var/lib/kubebook-ch39-etcd-plain /root/kubebook-ch39-plain.log
