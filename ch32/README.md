# 32 - Designing a Cluster, High Availability and Preparing the Machines; Building with kubeadm, Node Maintenance and Upgrades

The files the chapter **32**, in its parts **32.1 - Designing a Cluster, High Availability and Preparing the Machines** and **32.2 - Building with kubeadm, Node Maintenance and Upgrades**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch32`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

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
| `checksums.txt` | 32.1 › Designing a cluster and choosing where it runs › In practice (line 132) |  |
| `on.sh` | 32.1 › Designing a cluster and choosing where it runs › In practice (line 280) |  |
| `all.sh` | 32.1 › Designing a cluster and choosing where it runs › In practice (line 286) |  |
| `put.sh` | 32.1 › Designing a cluster and choosing where it runs › In practice (line 303) |  |
| `kind-ha.yaml` | 32.1 › High availability: stacked etcd, quorum and a load balancer › In practice (line 409) |  |
| `etcd.sh` | 32.1 › High availability: stacked etcd, quorum and a load balancer › In practice (line 458) |  |
| `prep.sh` | 32.1 › Preparing the machines: runtime, kernel settings and packages › In practice (line 632) |  |
| `init.sh` | 32.2 › Building the cluster with kubeadm: init, the network plugin and join › In practice (line 105) |  |
| `nodes.sh` | 32.2 › Building the cluster with kubeadm: init, the network plugin and join › In practice (line 258) |  |
| `web.sh` | 32.2 › Building the cluster with kubeadm: init, the network plugin and join › In practice (line 286) |  |
| `apibreak.sh` | 32.2 › Building the cluster with kubeadm: init, the network plugin and join › In practice (line 334) |  |
| `apifix.sh` | 32.2 › Building the cluster with kubeadm: init, the network plugin and join › In practice (line 355) |  |
| `node.sh` | 32.2 › Node maintenance: cordon, drain and uncordon › In practice (line 425) |  |
| `webwait.sh` | 32.2 › Node maintenance: cordon, drain and uncordon › In practice (line 438) |  |
| `cordon.sh` | 32.2 › Node maintenance: cordon, drain and uncordon › In practice (line 444) |  |
| `afterdrain.sh` | 32.2 › Node maintenance: cordon, drain and uncordon › In practice (line 489) |  |
| `bare.sh` | 32.2 › Node maintenance: cordon, drain and uncordon › In practice (line 552) |  |
| `snap.sh` | 32.2 › Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 646) |  |
| `upplan.sh` | 32.2 › Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 667) |  |
| `upapply.sh` | 32.2 › Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 722) |  |
| `upworker.sh` | 32.2 › Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 802) |  |
| `upwait.sh` | 32.2 › Upgrading with kubeadm: releases, version skew, the control plane, then the workers › In practice (line 848) |  |
| `pdb.sh` | 32.2 › Try it yourself (line 949) |  |

## Files the later chapters download

Chapter 32 downloads these from this repository at a pinned commit; no chapter block writes them.

- `terraform/vm2/aws/main.tf`
- `terraform/vm2/azure/main.tf`
- `terraform/vm2/gcp/main.tf`
- `terraform/vm2/cloud-init.sh.tftpl`
