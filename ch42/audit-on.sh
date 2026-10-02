#!/bin/sh
# usage: sh audit-on.sh POLICYFILE
# copies the policy into the node, adds the two hostPath volumes and the five audit flags to the API server manifest, and waits for the new flags
docker exec $CP mkdir -p /etc/kubernetes/audit /var/log/kubernetes/audit
docker exec -i $CP sh -c 'cat > /etc/kubernetes/audit/policy.yaml' < "$1"
docker cp audit-mounts.txt $CP:/root/audit-mounts.txt > /dev/null
docker cp audit-volumes.txt $CP:/root/audit-volumes.txt > /dev/null
docker exec $CP sed -i -e '/^    volumeMounts:$/r /root/audit-mounts.txt' -e '/^  volumes:$/r /root/audit-volumes.txt' -e 's#    - --tls-private-key-file=/etc/kubernetes/pki/apiserver.key#    - --tls-private-key-file=/etc/kubernetes/pki/apiserver.key\n    - --audit-policy-file=/etc/kubernetes/audit/policy.yaml\n    - --audit-log-path=/var/log/kubernetes/audit/audit.log\n    - --audit-log-maxage=30\n    - --audit-log-maxbackup=10\n    - --audit-log-maxsize=100#' /etc/kubernetes/manifests/kube-apiserver.yaml
sh wait-apiserver.sh with audit-log-path
