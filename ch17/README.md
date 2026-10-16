# 17 - Services and DNS - ClusterIP, NodePort, LoadBalancer, Headless Services and Discovery

The files the chapter **17 - Services and DNS - ClusterIP, NodePort, LoadBalancer, Headless Services and Discovery** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch17`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Explain why a Pod's address is a poor handle, and what a Service gives instead: a stable name and a virtual address
- Make a ClusterIP Service three ways, read its ports, selector and EndpointSlice, and read the refusals for a missing port name and a bad address
- Read how readiness, termination and `publishNotReadyAddresses` change the endpoints that a Service sends traffic to
- Find a Service by environment variable and by DNS name, read the search list and the CoreDNS settings, and change a Pod's `dnsPolicy`
- Use a headless Service, an ExternalName Service and a Service that has no selector
- Run queue workers through a Service and contact one named Indexed Job peer through headless DNS
- Reach a Service from outside with a NodePort, compare the two values of `externalTrafficPolicy`, and give kind a LoadBalancer with cloud-provider-kind
- Choose a session affinity and an internal traffic policy, and read the iptables rules that kube-proxy writes for one Service
- Give a Service a UDP port and an `appProtocol` hint, and check an SCTP port with the API server
- Give Services IPv4 and IPv6 addresses on a dual-stack cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Why a Service: Pods move, addresses change › In practice (line 85) |  |
| `web.yaml` | Why a Service: Pods move, addresses change › In practice (line 161) |  |
| `client.yaml` | Why a Service: Pods move, addresses change › In practice (line 222) |  |
| `two.yaml` | Why a Service: Pods move, addresses change › In practice (line 313) |  |
| `two-named.yaml` | Why a Service: Pods move, addresses change › In practice (line 344) |  |
| `cond.sh` | EndpointSlices: the list behind the address › In practice (line 536) |  |
| `hits.sh` | EndpointSlices: the list behind the address › In practice (line 541) |  |
| `ready.yaml` | EndpointSlices: the list behind the address › In practice (line 551) |  |
| `hl2.yaml` | EndpointSlices: the list behind the address › In practice (line 648) |  |
| `hl.yaml` | Headless Services, ExternalName and Services without a selector › In practice (line 915) |  |
| `nosel.yaml` | Headless Services, ExternalName and Services without a selector › In practice (line 984) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `queue.sh` | Jobs that use a queue or contact a named peer › Start the application queue (line 1076) |  |
| `worker.sh` | Jobs that use a queue or contact a named peer › Start the application queue (line 1134) |  |
| `peer.sh` | Jobs that use a queue or contact a named peer › Start the application queue (line 1159) |  |
| `seed.txt` | Jobs that use a queue or contact a named peer › Start the application queue (line 1185) |  |
| `health.txt` | Jobs that use a queue or contact a named peer › Start the application queue (line 1192) | written with printf |
| `queue.yaml` | Jobs that use a queue or contact a named peer › Start the application queue (line 1195) |  |
| `expected-initial.txt` | Jobs that use a queue or contact a named peer › Start the application queue (line 1274) |  |
| `coarse.yaml` | Jobs that use a queue or contact a named peer › Finish a fixed number of workers while work remains (line 1304) |  |
| `expected-coarse.txt` | Jobs that use a queue or contact a named peer › Finish a fixed number of workers while work remains (line 1341) |  |
| `expected-fine.txt` | Jobs that use a queue or contact a named peer › Drain the remaining queue and inspect the results (line 1386) |  |
| `expected-later.txt` | Jobs that use a queue or contact a named peer › Add work after the Job has completed (line 1435) |  |
| `peers.yaml` | Jobs that use a queue or contact a named peer › Contact one specific Indexed Job peer (line 1468) |  |
| `expected-peers.txt` | Jobs that use a queue or contact a named peer › Contact one specific Indexed Job peer (line 1536) | written with printf |
| `echo.yaml` | Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 1610) |  |
| `icmp.yaml` | Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 1692) |  |
| `sctp.yaml` | Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 1721) |  |
| `req.yaml` | Dual-stack Services: IPv4 and IPv6 together › In practice (line 1768) |  |
| `kind-dual.yaml` | Dual-stack Services: IPv4 and IPv6 together › In practice (line 1818) |  |
| `mask.sh` | Dual-stack Services: IPv4 and IPv6 together › In practice (line 1851) |  |
| `dual-apps.yaml` | Dual-stack Services: IPv4 and IPv6 together › In practice (line 1890) |  |
| `dual-svcs.yaml` | Dual-stack Services: IPv4 and IPv6 together › In practice (line 1953) |  |
| `np.yaml` | NodePort: a port on every node › In practice (line 2182) |  |
| `source-ip/nginx.conf` | NodePort: a port on every node › Measure the address of an outside client (line 2354) |  |
| `source-ip/workload.yaml` | NodePort: a port on every node › Measure the address of an outside client (line 2366) |  |
| `source-ip/check.py` | NodePort: a port on every node › Measure the address of an outside client (line 2429) |  |
| `check.sh` | kube-proxy and the virtual address › In practice (line 2994) |  |
| `ex-site.yaml` | Try it yourself (line 3055) |  |
| `ex-bad.yaml` | Try it yourself (line 3108) |  |
| `ex-good.yaml` | Try it yourself (line 3136) |  |
| `ex-np.yaml` | Try it yourself (line 3182) |  |
| `ex-hl.yaml` | Try it yourself (line 3222) |  |
| `ex-gate.yaml` | Try it yourself (line 3250) |  |
| `ex-dns.yaml` | Try it yourself (line 3293) |  |
| `ex-dns2.yaml` | Try it yourself (line 3322) |  |
| `ex-v6.yaml` | Try it yourself (line 3354) |  |
