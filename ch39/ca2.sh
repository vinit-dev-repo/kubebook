#!/bin/sh
mkdir -p /root/kubebook-ch39-ex-pki
cd /root/kubebook-ch39-ex-pki
openssl genrsa -out ca.key 2048 2>/dev/null
openssl req -x509 -new -key ca.key -subj "/CN=kubebook-ch39-ex-ca" -days 1 -out ca.crt
openssl genrsa -out client.key 2048 2>/dev/null
openssl req -new -key client.key -subj "/CN=kubebook-ch39-ex-client" -out client.csr
printf 'extendedKeyUsage = clientAuth\n' > client.ext
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 1 -extfile client.ext -out client.crt > /dev/null 2>&1
curl -sk -o /dev/null -w "%{http_code}" --cert client.crt --key client.key https://127.0.0.1:10250/pods
echo " 10250 /pods, a certificate from an unknown CA, rc=$?"
sleep 1
journalctl -u kubelet --no-pager | grep -q 'Unable to authenticate the request' && echo "the kubelet log names a failed authentication: yes"
openssl genrsa -out viewer.key 2048 2>/dev/null
openssl req -new -key viewer.key -subj "/CN=kubebook-ch39-ex-viewer" -out viewer.csr
openssl x509 -req -in viewer.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -days 1 -extfile client.ext -out viewer.crt > /dev/null 2>&1
curl -sk -o /dev/null -w "%{http_code}" --cert viewer.crt --key viewer.key https://127.0.0.1:10250/pods
echo " 10250 /pods, a cluster-CA certificate with no role, rc=$?"
curl -sk -o /dev/null -w "%{http_code}" --cert /etc/kubernetes/pki/apiserver-kubelet-client.crt --key /etc/kubernetes/pki/apiserver-kubelet-client.key https://127.0.0.1:10250/pods
echo " 10250 /pods, the API server certificate, rc=$?"
