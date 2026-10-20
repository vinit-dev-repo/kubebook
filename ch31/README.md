# 31 - Linux Networking by Hand, the Network Model and CNI, Pods across Nodes and IPAM; Service Rules, Ports, CoreDNS and Calico

The files the chapter **31**, in its parts **31.1 - Linux Networking by Hand, the Network Model and CNI, Pods across Nodes and IPAM** and **31.2 - Service Rules, Ports, CoreDNS and Calico**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch31`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

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
| `kind.yaml` | 31.1 › Linux networking inside a node: routes, namespaces, veth pairs, a bridge and NAT › In practice (line 82) |  |
| `mask.sed` | 31.1 › Pod networking across nodes › In practice (line 558) |  |
| `pods.yaml` | 31.1 › Pod networking across nodes › In practice (line 574) |  |
| `static-svc.yaml` | 31.1 › IPAM: who hands out which address › In practice (line 777) |  |
| `extra-pool.yaml` | 31.1 › IPAM: who hands out which address › Extend the pool, then retire the added range (line 851) |  |
| `reserved-service.yaml` | 31.1 › IPAM: who hands out which address › Extend the pool, then retire the added range (line 884) |  |
| `kind-calico.yaml` | 31.2 › Changing the network plugin: Calico › In practice (line 456) |  |
| `kind-ex.yaml` | 31.2 › Try it yourself (line 677) |  |
| `ex-pods.yaml` | 31.2 › Try it yourself (line 706) |  |
| `ex-new.yaml` | 31.2 › Try it yourself (line 800) |  |
