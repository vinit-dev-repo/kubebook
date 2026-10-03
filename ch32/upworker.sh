#!/bin/bash
# usage: sudo bash upworker.sh   (worker: next minor repository, kubeadm, upgrade node, kubelet and kubectl)
export DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a
APT="apt-get -o DPkg::Lock::Timeout=120 -y"
sed -i 's#/v1.35/#/v1.36/#' /etc/apt/sources.list.d/kubernetes.list
for i in 1 2 3 4 5 6; do apt-get update > /dev/null 2>&1 && break; sleep 10; done
apt-mark unhold kubeadm > /dev/null
$APT install kubeadm=1.36.4-1.1 > /dev/null 2>&1
apt-mark hold kubeadm > /dev/null
rc=0
kubeadm upgrade node > /root/upnode.log 2>&1 || rc=$?
echo "upgrade node rc $rc"
grep -o 'Skipping the addon/kube-proxy phase. Not a control plane node.' /root/upnode.log | awk 'NR == 1'
apt-mark unhold kubelet kubectl > /dev/null
$APT install kubelet=1.36.4-1.1 kubectl=1.36.4-1.1 > /dev/null 2>&1
apt-mark hold kubelet kubectl > /dev/null
systemctl daemon-reload
systemctl restart kubelet
echo "kubelet $(kubelet --version | awk '{print $2}')"
