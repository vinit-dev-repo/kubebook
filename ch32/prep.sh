#!/bin/bash
# usage: sudo bash prep.sh   (every machine; prints only the lines that start with echo)
set -eo pipefail
export DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a
APT="apt-get -o DPkg::Lock::Timeout=120 -y"
update() { for i in 1 2 3 4 5 6; do apt-get update > /dev/null 2>&1 && return 0; sleep 10; done; return 1; }
printf 'overlay\nbr_netfilter\n' > /etc/modules-load.d/k8s.conf
modprobe overlay
modprobe br_netfilter
printf 'net.bridge.bridge-nf-call-iptables = 1\nnet.bridge.bridge-nf-call-ip6tables = 1\nnet.ipv4.ip_forward = 1\n' > /etc/sysctl.d/k8s.conf
sysctl --system > /dev/null
echo "modules loaded: $(lsmod | grep -cE '^(overlay|br_netfilter) ')"
echo "settings: $(sysctl -n net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward | paste -sd' ')"
update
$APT install containerd apt-transport-https ca-certificates curl gpg > /dev/null 2>&1
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
systemctl restart containerd
echo "containerd $(containerd --version | awk '{print $3}'), SystemdCgroup set to true on $(grep -c 'SystemdCgroup = true' /etc/containerd/config.toml) line"
mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.35/deb/Release.key | gpg --dearmor --yes -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /' > /etc/apt/sources.list.d/kubernetes.list
update
echo "offered: $(apt-cache madison kubeadm | awk '{print $3}' | grep -E '^1\.35\.(9|8|7)-' | paste -sd' ')"
$APT install kubelet=1.35.9-1.1 kubeadm=1.35.9-1.1 kubectl=1.35.9-1.1 cri-tools > /dev/null 2>&1
apt-mark hold kubelet kubeadm kubectl > /dev/null
echo "crictl: $(command -v crictl > /dev/null && echo installed || echo missing)"
echo "kubeadm $(kubeadm version -o short) kubelet $(kubelet --version | awk '{print $2}')"
echo "kubelet service: $(systemctl is-enabled kubelet), $(systemctl is-active kubelet || true)"
