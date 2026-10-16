# 32 - Building a Cluster with kubeadm - Design, High Availability, Upgrades and Node Maintenance

The files the chapter **32 - Building a Cluster with kubeadm - Design, High Availability, Upgrades and Node Maintenance** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch32`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Choose where a cluster runs, size it, and say what a cluster for real users needs that a laptop cluster does not
- Build the same two-machine lab on AWS, Azure and Google Cloud from one set of Terraform files, and reach it over SSH
- Say why a control plane has three members, and watch a three-member control plane in kind lose and regain its quorum
- Prepare a stock Ubuntu machine for Kubernetes: kernel modules, sysctl settings, containerd with the systemd cgroup driver, and held packages
- Run `kubeadm init`, read what it wrote, install the network plugin Calico, join a worker, and read a broken API server from the node
- Cordon, drain and uncordon a node, and say what a drain leaves alone and what it refuses
- Upgrade a cluster by one minor version, control plane first and then each worker, after an etcd snapshot, and read the version skew rules

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `checksums.txt` | Designing a cluster and choosing where it runs › In practice (line 135) |  |
| `on.sh` | Designing a cluster and choosing where it runs › In practice (line 280) |  |
| `all.sh` | Designing a cluster and choosing where it runs › In practice (line 286) |  |
| `put.sh` | Designing a cluster and choosing where it runs › In practice (line 303) |  |
| `kind-ha.yaml` | High availability: stacked etcd, quorum and a load balancer › In practice (line 397) |  |
| `etcd.sh` | High availability: stacked etcd, quorum and a load balancer › In practice (line 446) |  |
| `prep.sh` | Preparing the machines: runtime, kernel settings and packages › In practice (line 601) |  |
| `init.sh` | Building the cluster with kubeadm: init, the network plugin and join › In practice (line 743) |  |
| `nodes.sh` | Building the cluster with kubeadm: init, the network plugin and join › In practice (line 895) |  |
| `web.sh` | Building the cluster with kubeadm: init, the network plugin and join › In practice (line 922) |  |
| `apibreak.sh` | Building the cluster with kubeadm: init, the network plugin and join › In practice (line 967) |  |
| `apifix.sh` | Building the cluster with kubeadm: init, the network plugin and join › In practice (line 988) |  |
| `node.sh` | Node maintenance: cordon, drain and uncordon › In practice (line 1045) |  |
| `webwait.sh` | Node maintenance: cordon, drain and uncordon › In practice (line 1058) |  |
| `cordon.sh` | Node maintenance: cordon, drain and uncordon › In practice (line 1064) |  |
| `afterdrain.sh` | Node maintenance: cordon, drain and uncordon › In practice (line 1106) |  |
| `bare.sh` | Node maintenance: cordon, drain and uncordon › In practice (line 1168) |  |
| `snap.sh` | Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 1245) |  |
| `upplan.sh` | Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 1265) |  |
| `upapply.sh` | Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 1317) |  |
| `upworker.sh` | Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 1395) |  |
| `upwait.sh` | Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 1440) |  |
| `pdb.sh` | Try it yourself (line 1539) |  |

## Files the later chapters download

Chapter 32 downloads these from this repository at a pinned commit; no chapter block writes them.

- `terraform/vm2/aws/main.tf`
- `terraform/vm2/azure/main.tf`
- `terraform/vm2/gcp/main.tf`
- `terraform/vm2/cloud-init.sh.tftpl`
