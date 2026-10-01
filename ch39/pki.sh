#!/bin/sh
set -e
mkdir -p /root/kubebook-ch39-etcd-pki
cd /root/kubebook-ch39-etcd-pki
openssl genrsa -out ca.key 2048 2>/dev/null
openssl req -x509 -new -key ca.key -subj "/CN=kubebook-ch39-etcd-ca" -days 30 -out ca.crt
printf 'subjectAltName = IP:127.0.0.1, DNS:localhost\nextendedKeyUsage = serverAuth, clientAuth\n' > server.ext
printf 'extendedKeyUsage = clientAuth\n' > client.ext
openssl genrsa -out server.key 2048 2>/dev/null
openssl req -new -key server.key -subj "/CN=kubebook-ch39-etcd" -out server.csr
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile server.ext -out server.crt > /dev/null 2>&1
openssl genrsa -out client.key 2048 2>/dev/null
openssl req -new -key client.key -subj "/CN=kubebook-ch39-client" -out client.csr
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile client.ext -out client.crt > /dev/null 2>&1
chmod 600 ca.key server.key client.key
openssl x509 -in ca.crt -noout -subject -ext basicConstraints
openssl x509 -in server.crt -noout -ext subjectAltName | grep -o 'IP Address:[0-9.]*\|DNS:[a-z]*'
openssl verify -CAfile ca.crt server.crt client.crt
