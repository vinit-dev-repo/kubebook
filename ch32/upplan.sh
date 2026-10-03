#!/bin/bash
# usage: sudo bash upplan.sh   (control plane: next minor repository, new kubeadm, upgrade plan)
export DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a KUBECONFIG=/etc/kubernetes/admin.conf
APT="apt-get -o DPkg::Lock::Timeout=120 -y"
sed -i 's#/v1.35/#/v1.36/#' /etc/apt/sources.list.d/kubernetes.list
echo "repository: $(awk '{print $3}' /etc/apt/sources.list.d/kubernetes.list)"
for i in 1 2 3 4 5 6; do apt-get update > /dev/null 2>&1 && break; sleep 10; done
echo "offered: $(apt-cache madison kubeadm | awk '{print $3}' | grep -E '^1\.36\.4-' | paste -sd' ')"
apt-mark unhold kubeadm > /dev/null
$APT install kubeadm=1.36.4-1.1 > /dev/null 2>&1
apt-mark hold kubeadm > /dev/null
echo "kubeadm $(kubeadm version -o short), the cluster is $(kubectl version | awk '/^Server Version/ {print $3}')"
rc=0
kubeadm upgrade plan > /root/plan.log 2>&1 || rc=$?
echo "plan rc $rc"
awk '/^kube-apiserver/ {print "kube-apiserver: now", $3 ", target in", substr($4, 1, 5)}' /root/plan.log
echo "the plan suggests: $(grep -o 'kubeadm upgrade apply v1\.36' /root/plan.log | awk 'NR == 1')"
