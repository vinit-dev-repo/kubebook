# 17 - Services, Ports and EndpointSlices; Discovery, Headless Services and Jobs That Use a Queue; Service Protocols and Dual-Stack Services; NodePort and LoadBalancer on kind; Traffic Policies, kube-proxy and the Exercises

The files the chapter **17**, in its parts **17.1 - Services, Ports and EndpointSlices**, **17.2 - Discovery, Headless Services and Jobs That Use a Queue**, **17.3 - Service Protocols and Dual-Stack Services**, **17.4 - NodePort and LoadBalancer on kind** and **17.5 - Traffic Policies, kube-proxy and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch17`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Explain why a Pod's address is a poor handle, and what a Service gives instead: a stable name and a virtual address
- Make a ClusterIP Service three ways, read its ports, selector and EndpointSlice, and read the refusals for a missing port name and a bad address
- Read how readiness, termination and `publishNotReadyAddresses` change the endpoints that a Service sends traffic to
- Find a Service by environment variable and by DNS name, read the search list and the CoreDNS settings, and change a Pod's `dnsPolicy`
- Use a headless Service, an ExternalName Service and a Service that has no selector
- Run queue workers through a Service and contact one named Indexed Job peer through headless DNS
- Give a Service a UDP port and an `appProtocol` hint, and check an SCTP port with the API server
- Give Services IPv4 and IPv6 addresses on a dual-stack cluster
- Reach a Service from outside with a NodePort, and compare the two values of `externalTrafficPolicy`
- Give kind a LoadBalancer with cloud-provider-kind, and read the Gateway API definitions and the IngressClass that it installs
- Choose a session affinity and an internal traffic policy, and read how zones and hints narrow the endpoints
- Read the iptables rules that kube-proxy writes for one Service, and run the first checks of the Debug Services page
- Run the eight exercises of the chapter and delete its cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 17.1 › Why a Service: Pods move, addresses change › In practice (line 83) |  |
| `web.yaml` | 17.1 › Why a Service: Pods move, addresses change › In practice (line 161) |  |
| `client.yaml` | 17.1 › Why a Service: Pods move, addresses change › In practice (line 223) |  |
| `two.yaml` | 17.1 › Why a Service: Pods move, addresses change › In practice (line 313) |  |
| `two-named.yaml` | 17.1 › Why a Service: Pods move, addresses change › In practice (line 343) |  |
| `cond.sh` | 17.1 › EndpointSlices: the list behind the address › In practice (line 537) |  |
| `hits.sh` | 17.1 › EndpointSlices: the list behind the address › In practice (line 542) |  |
| `ready.yaml` | 17.1 › EndpointSlices: the list behind the address › In practice (line 553) |  |
| `hl2.yaml` | 17.1 › EndpointSlices: the list behind the address › In practice (line 653) |  |
| `hl.yaml` | 17.2 › Headless Services, ExternalName and Services without a selector › In practice (line 296) |  |
| `nosel.yaml` | 17.2 › Headless Services, ExternalName and Services without a selector › In practice (line 368) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `queue.sh` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 465) |  |
| `worker.sh` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 523) |  |
| `peer.sh` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 548) |  |
| `seed.txt` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 574) |  |
| `health.txt` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 581) | written with printf |
| `queue.yaml` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 584) |  |
| `expected-initial.txt` | 17.2 › Jobs that use a queue or contact a named peer › Start the application queue (line 663) |  |
| `coarse.yaml` | 17.2 › Jobs that use a queue or contact a named peer › Finish a fixed number of workers while work remains (line 691) |  |
| `expected-coarse.txt` | 17.2 › Jobs that use a queue or contact a named peer › Finish a fixed number of workers while work remains (line 728) |  |
| `expected-fine.txt` | 17.2 › Jobs that use a queue or contact a named peer › Drain the remaining queue and inspect the results (line 771) |  |
| `expected-later.txt` | 17.2 › Jobs that use a queue or contact a named peer › Add work after the Job has completed (line 818) |  |
| `peers.yaml` | 17.2 › Jobs that use a queue or contact a named peer › Contact one specific Indexed Job peer (line 851) |  |
| `expected-peers.txt` | 17.2 › Jobs that use a queue or contact a named peer › Contact one specific Indexed Job peer (line 919) | written with printf |
| `echo.yaml` | 17.3 › Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 64) |  |
| `icmp.yaml` | 17.3 › Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 146) |  |
| `sctp.yaml` | 17.3 › Service protocols: TCP, UDP, SCTP and appProtocol › In practice (line 174) |  |
| `req.yaml` | 17.3 › Dual-stack Services: IPv4 and IPv6 together › In practice (line 229) |  |
| `kind-dual.yaml` | 17.3 › Dual-stack Services: IPv4 and IPv6 together › In practice (line 277) |  |
| `mask.sh` | 17.3 › Dual-stack Services: IPv4 and IPv6 together › In practice (line 310) |  |
| `dual-apps.yaml` | 17.3 › Dual-stack Services: IPv4 and IPv6 together › In practice (line 349) |  |
| `dual-svcs.yaml` | 17.3 › Dual-stack Services: IPv4 and IPv6 together › In practice (line 415) |  |
| `np.yaml` | 17.4 › NodePort: a port on every node › In practice (line 67) |  |
| `source-ip/nginx.conf` | 17.4 › NodePort: a port on every node › Measure the address of an outside client (line 241) |  |
| `source-ip/workload.yaml` | 17.4 › NodePort: a port on every node › Measure the address of an outside client (line 253) |  |
| `source-ip/check.py` | 17.4 › NodePort: a port on every node › Measure the address of an outside client (line 316) |  |
| `check.sh` | 17.5 › kube-proxy and the virtual address › In practice (line 249) |  |
| `ex-site.yaml` | 17.5 › Try it yourself (line 303) |  |
| `ex-bad.yaml` | 17.5 › Try it yourself (line 356) |  |
| `ex-good.yaml` | 17.5 › Try it yourself (line 384) |  |
| `ex-np.yaml` | 17.5 › Try it yourself (line 430) |  |
| `ex-hl.yaml` | 17.5 › Try it yourself (line 470) |  |
| `ex-gate.yaml` | 17.5 › Try it yourself (line 498) |  |
| `ex-dns.yaml` | 17.5 › Try it yourself (line 541) |  |
| `ex-dns2.yaml` | 17.5 › Try it yourself (line 570) |  |
| `ex-v6.yaml` | 17.5 › Try it yourself (line 602) |  |
