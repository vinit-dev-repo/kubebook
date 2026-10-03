#!/bin/bash
# usage: sudo bash upapply.sh   (control plane: apply, drain, kubelet and kubectl, uncordon)
export DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a KUBECONFIG=/etc/kubernetes/admin.conf
APT="apt-get -o DPkg::Lock::Timeout=120 -y"
rc=0
kubeadm upgrade apply v1.36.4 -y > /root/apply.log 2>&1 || rc=$?
echo "apply rc $rc"
[ "$rc" = 0 ] || exit 1
grep -o 'The control plane instance for this node was successfully upgraded' /root/apply.log | awk 'NR == 1'
grep -o 'SUCCESS! Your cluster was upgraded to "v1.36.4"' /root/apply.log | awk 'NR == 1'
echo "kubeadm backups: $(ls /etc/kubernetes/tmp | sed -E 's/-20[0-9]{2}-.*//' | sort -u | paste -sd' ')"
kubectl version | grep -E '^(Client|Server) Version'
N=$(kubectl get nodes -l node-role.kubernetes.io/control-plane -o jsonpath='{.items[0].metadata.name}')
echo "the node before the kubelet changes: $(kubectl get node "$N" --no-headers | awk '{print $2, $5}')"
kubectl drain "$N" --ignore-daemonsets > /root/drain.log 2>&1
echo "drain rc $?"
apt-mark unhold kubelet kubectl > /dev/null
$APT install kubelet=1.36.4-1.1 kubectl=1.36.4-1.1 > /dev/null 2>&1
apt-mark hold kubelet kubectl > /dev/null
systemctl daemon-reload
systemctl restart kubelet
end=$(( $(date +%s) + 240 ))
while [ "$(date +%s)" -lt "$end" ]; do kubectl get nodes -l node-role.kubernetes.io/control-plane --no-headers 2> /dev/null | awk '$2 == "Ready" && $5 == "v1.36.4" {f=1} END {exit !f}' && break; sleep 3; done
kubectl uncordon "$N" > /dev/null
echo "the node after the uncordon: $(kubectl get node "$N" --no-headers | awk '{print $2, $5}')"
