#!/bin/sh
# usage: sh selfreview.sh TOKEN
# asks the API server who the token belongs to (a SelfSubjectReview) and prints the identity
for i in $(seq 1 30); do
  out=$(curl -s --cacert /etc/kubernetes/pki/ca.crt -H "Authorization: Bearer $1" -X POST -H "Content-Type: application/json" -d '{"apiVersion":"authentication.k8s.io/v1","kind":"SelfSubjectReview"}' https://127.0.0.1:6443/apis/authentication.k8s.io/v1/selfsubjectreviews) && echo "$out" | grep -q '"username"' && break
  sleep 2
done
echo "$out" | grep -E '"(username|uid)"|kubebook-devs|authenticated'
