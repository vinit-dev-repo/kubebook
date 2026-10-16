# 31 - Cluster Networking - CNI, Pod and Service Networking, and CoreDNS

The files the chapter **31 - Cluster Networking - CNI, Pod and Service Networking, and CoreDNS** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch31`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Build a small network by hand inside a node: a route, a network namespace, a veth pair, a bridge and a NAT rule
- State the Kubernetes network model, and read how the network plugin kindnet builds it from one config file and a few programs
- Follow a packet between two Pods on two nodes through the routes of the nodes
- Tell the node, Pod and Service address ranges apart, and say who hands out each one
- Add a Service address range, inspect its allocation, and observe protected deletion before releasing that address
- Read the iptables chains of a Service, and the ports that the parts of a cluster listen on
- Read the CoreDNS Corefile line by line, add a name of your own to it, and restore it
- Install Calico on a cluster that has no network plugin, and read what it changed on the nodes

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Linux networking inside a node: routes, namespaces, veth pairs, a bridge and NAT › In practice (line 85) |  |
| `mask.sed` | Pod networking across nodes › In practice (line 551) |  |
| `pods.yaml` | Pod networking across nodes › In practice (line 568) |  |
| `static-svc.yaml` | IPAM: who hands out which address › In practice (line 761) |  |
| `extra-pool.yaml` | IPAM: who hands out which address › Extend the pool, then retire the added range (line 837) |  |
| `reserved-service.yaml` | IPAM: who hands out which address › Extend the pool, then retire the added range (line 871) |  |
| `kind-calico.yaml` | Changing the network plugin: Calico › In practice (line 1386) |  |
| `kind-ex.yaml` | Try it yourself (line 1607) |  |
| `ex-pods.yaml` | Try it yourself (line 1636) |  |
| `ex-new.yaml` | Try it yourself (line 1730) |  |
