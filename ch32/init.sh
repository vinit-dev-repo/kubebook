#!/bin/bash
# usage: sudo bash init.sh PRIVATE_IP   (control plane only)
set -eo pipefail
IP=$1
echo "images: $(kubeadm config images list --kubernetes-version v1.35.9 | sed 's#.*/##' | paste -sd' ')"
install -m 600 /dev/null /root/kubeadm-init.log
rc=0
kubeadm init --kubernetes-version v1.35.9 --apiserver-advertise-address "$IP" --pod-network-cidr 192.168.0.0/16 > /root/kubeadm-init.log 2>&1 || rc=$?
echo "init rc $rc"
[ "$rc" = 0 ] || exit 1
echo "phases: $(grep -oE '^\[(preflight|certs|kubeconfig|etcd|control-plane|kubelet-start|mark-control-plane|bootstrap-token|addons)\]' /root/kubeadm-init.log | uniq | paste -sd' ')"
echo "initialized: $(grep -c 'has initialized successfully' /root/kubeadm-init.log)"
mkdir -p /home/ubuntu/.kube
cp /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
chown -R ubuntu:ubuntu /home/ubuntu/.kube
export KUBECONFIG=/etc/kubernetes/admin.conf
echo "the node before a network plugin: $(kubectl get nodes --no-headers | awk '{print $2, $5}')"
for i in $(seq 1 30); do [ "$(kubectl -n kube-system get pods -l k8s-app=kube-dns --no-headers 2> /dev/null | wc -l)" = 2 ] && break; sleep 2; done
echo "coredns: $(kubectl -n kube-system get pods -l k8s-app=kube-dns --no-headers 2> /dev/null | awk '{print $3}' | sort -u)"
