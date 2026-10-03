#!/bin/bash
# usage: sudo bash apibreak.sh   (breaks the API server on purpose and reads the evidence from the node)
M=/etc/kubernetes/manifests/kube-apiserver.yaml
cp $M /root/kube-apiserver.yaml.good
sed -i 's/--secure-port=6443/--secure-portX=6443/' $M
echo "changed lines: $(grep -c 'secure-portX' $M)"
export KUBECONFIG=/etc/kubernetes/admin.conf
end=$(( $(date +%s) + 180 ))
while [ "$(date +%s)" -lt "$end" ]; do kubectl get nodes --request-timeout=5s > /dev/null 2>&1 || break; sleep 3; done
kubectl get nodes --request-timeout=5s > /dev/null 2>&1 || echo "kubectl gets no answer"
CRI="crictl --runtime-endpoint unix:///run/containerd/containerd.sock"
end=$(( $(date +%s) + 120 ))
while [ "$(date +%s)" -lt "$end" ]; do
  id=$($CRI ps -a --name kube-apiserver --state exited -q 2> /dev/null | awk 'NR == 1')
  [ -n "$id" ] && $CRI logs $id 2>&1 | grep -q 'unknown flag: --secure-portX' && break
  sleep 3
done
echo "crictl logs: $($CRI logs $id 2>&1 | grep -o 'unknown flag: --secure-portX' | awk 'NR == 1')"
echo "the kubelet journal names the API server: $(journalctl -u kubelet --no-pager | grep -c 'kube-apiserver' | awk '{print ($1 > 0) ? "yes" : "no"}')"
