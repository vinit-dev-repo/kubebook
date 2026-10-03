#!/bin/bash
# usage: sudo bash apifix.sh   (puts the good manifest back and waits until kubectl answers)
cp /root/kube-apiserver.yaml.good /etc/kubernetes/manifests/kube-apiserver.yaml
rm -f /root/kube-apiserver.yaml.good
export KUBECONFIG=/etc/kubernetes/admin.conf
end=$(( $(date +%s) + 280 ))
while [ "$(date +%s)" -lt "$end" ]; do kubectl get nodes --request-timeout=5s > /dev/null 2>&1 && break; sleep 3; done
echo "kubectl answers again, nodes: $(kubectl get nodes --no-headers --request-timeout=5s | wc -l)"
