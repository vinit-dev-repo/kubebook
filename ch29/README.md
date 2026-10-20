# 29 - The Parts of a Cluster, the API Server, Feature Gates, etcd and Leases; Controllers, the Scheduler, the Kubelet and Node Resources; Node Shutdown, kubeadm Settings, Versions and kube-proxy

The files the chapter **29**, in its parts **29.1 - The Parts of a Cluster, the API Server, Feature Gates, etcd and Leases**, **29.2 - Controllers, the Scheduler, the Kubelet and Node Resources** and **29.3 - Node Shutdown, kubeadm Settings, Versions and kube-proxy**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch29`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Name every part of the control plane and of a node, say where each one runs, and tell a static Pod from a DaemonSet Pod
- Follow a request through the API server, and read its flags, its health paths and its API priority levels
- Switch feature gates and API versions, and read which ones a component runs with
- Read etcd with `etcdctl`, find the key of an object, and see that a Secret is stored there in plain text
- Read the Leases that carry node heartbeats and the leader election of the controller manager and the scheduler
- Watch the controllers and the scheduler work through events, and stop each one on purpose to see what it does
- Read the kubelet's service, its config file, its ports and a node's status, and restart a node
- Reserve node resources, lend swap, and read what allocatable and the cgroup limit become
- Pin CPUs with the CPU Manager, and read why the Topology Manager refuses a Pod
- Shut a node down gracefully and by a power cut, and free a stuck Pod with the out-of-service taint
- Change kubeadm's component flags on a running cluster, and reset a node
- Check the kernel's minimum versions, and let an API server forward requests to its peer
- Read the Service rules that kube-proxy writes on every node
- Clean up the cluster, the objects and the files of the chapter

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 29.1 › The parts of a cluster and where they run › In practice (line 74) |  |
| `kind-gates.yaml` | 29.1 › Feature gates and API versions: turning features on and off › In practice (line 433) |  |
| `etcd.sh` | 29.1 › etcd › In practice (line 551) |  |
| `kind-node.yaml` | 29.2 › Node allocatable and swap: reserved resources, eviction thresholds and LimitedSwap › In practice (line 378) |  |
| `swap-pods.yaml` | 29.2 › Node allocatable and swap: reserved resources, eviction thresholds and LimitedSwap › In practice (line 437) |  |
| `kind-cpu.yaml` | 29.2 › The resource managers: CPU, memory and topology › In practice (line 542) |  |
| `cpu-pods.yaml` | 29.2 › The resource managers: CPU, memory and topology › In practice (line 586) |  |
| `too-big.yaml` | 29.2 › The resource managers: CPU, memory and topology › In practice (line 651) |  |
| `kind-shut.yaml` | 29.3 › Node shutdown: graceful and non-graceful › In practice (line 71) |  |
| `web.yaml` | 29.3 › Node shutdown: graceful and non-graceful › In practice (line 120) |  |
| `db.yaml` | 29.3 › Node shutdown: graceful and non-graceful › In practice (line 155) |  |
| `kind-adm.yaml` | 29.3 › kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 271) |  |
| `kubelet.yaml` | 29.3 › kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 337) | written with echo |
| `init.yaml` | 29.3 › kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 363) |  |
| `kube-controller-manager+strategic.yaml` | 29.3 › kubeadm settings: component flags, reconfiguring a running cluster and kubeadm reset › In practice (line 370) |  |
| `kernel-pod.yaml` | 29.3 › Version requirements: the node's kernel and API servers of two releases › In practice (line 530) |  |
| `kind-ha.yaml` | 29.3 › Version requirements: the node's kernel and API servers of two releases › In practice (line 570) |  |
| `api.sh` | 29.3 › Version requirements: the node's kernel and API servers of two releases › In practice (line 599) |  |
| `ex-direct.yaml` | 29.3 › Try it yourself (line 843) |  |
| `ex-swap.yaml` | 29.3 › Try it yourself (line 891) |  |
