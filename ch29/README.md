# 29 - The Control Plane Up Close - etcd, the API Server, the Controller Manager, the Scheduler, the Kubelet and kube-proxy

The files the chapter **29 - The Control Plane Up Close - etcd, the API Server, the Controller Manager, the Scheduler, the Kubelet and kube-proxy** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch29`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Name every part of the control plane and of a node, say where each one runs, and tell a static Pod from a DaemonSet Pod
- Follow a request through the API server, and read its flags, its health paths and its API priority levels
- Read etcd with `etcdctl`, find the key of an object, and see that a Secret is stored there in plain text
- Read the Leases that carry node heartbeats and the leader election of the controller manager and the scheduler
- Watch the controllers and the scheduler work through events, and stop each one on purpose to see what it does
- Read the kubelet's service, its config file, its ports and a node's status, and restart a node
- Read the Service rules that kube-proxy writes on every node
- Switch feature gates and API versions, reserve node resources, lend swap, pin CPUs and shut a node down gracefully
- Change kubeadm's component flags on a running cluster, and reset a node
- Check the kernel's minimum versions, and let an API server forward requests to its peer

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | The parts of a cluster and where they run › In practice (line 79) |  |
| `kind-gates.yaml` | Feature gates and API versions: turning features on and off › In practice (line 412) |  |
| `etcd.sh` | etcd › In practice (line 525) |  |
| `kind-node.yaml` | Node allocatable and swap: reserved resources, eviction thresholds and LimitedSwap › In practice (line 1031) |  |
| `swap-pods.yaml` | Node allocatable and swap: reserved resources, eviction thresholds and LimitedSwap › In practice (line 1090) |  |
| `kind-cpu.yaml` | The resource managers: CPU, memory and topology › In practice (line 1186) |  |
| `cpu-pods.yaml` | The resource managers: CPU, memory and topology › In practice (line 1229) |  |
| `too-big.yaml` | The resource managers: CPU, memory and topology › In practice (line 1294) |  |
| `kind-shut.yaml` | Node shutdown: graceful and non-graceful › In practice (line 1363) |  |
| `web.yaml` | Node shutdown: graceful and non-graceful › In practice (line 1410) |  |
| `db.yaml` | Node shutdown: graceful and non-graceful › In practice (line 1444) |  |
| `kind-adm.yaml` | kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 1554) |  |
| `kubelet.yaml` | kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 1620) | written with echo |
| `init.yaml` | kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 1647) |  |
| `kube-controller-manager+strategic.yaml` | kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 1654) |  |
| `kernel-pod.yaml` | Version requirements: the node's kernel and API servers of two releases › In practice (line 1809) |  |
| `kind-ha.yaml` | Version requirements: the node's kernel and API servers of two releases › In practice (line 1850) |  |
| `api.sh` | Version requirements: the node's kernel and API servers of two releases › In practice (line 1878) |  |
| `ex-direct.yaml` | Try it yourself (line 2122) |  |
| `ex-swap.yaml` | Try it yourself (line 2170) |  |
