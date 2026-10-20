# 43 - Cilium as the Cluster Network and Layer 3 and 4 Policies; Layer 7 and DNS Policies and Transparent Encryption; A Service Mesh, Istio and Mutual TLS

The files the chapter **43**, in its parts **43.1 - Cilium as the Cluster Network and Layer 3 and 4 Policies**, **43.2 - Layer 7 and DNS Policies and Transparent Encryption** and **43.3 - A Service Mesh, Istio and Mutual TLS**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch43`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Install Cilium on a kind cluster that has no network plugin, and read the status and the facts that it reports
- Say what eBPF, an identity and the Cilium agent are
- Write a CiliumNetworkPolicy with endpoints, entities and ports, and read a dropped packet as a timeout
- Write a deny rule, and say why a deny wins over an allow
- Allow one HTTP method and path through Envoy, and read the 403 that Envoy sends for the rest
- Limit egress to one DNS name, and say why the DNS rule is needed
- Read one Hubble flow, and see the DNS proxy refuse a question
- Switch on transparent encryption between nodes with WireGuard and with IPsec, and read the proof on the nodes
- Say what a service mesh adds to microservices, and install Istio with `istioctl` after a checksum check
- Inject a sidecar with a namespace label
- Tell PERMISSIVE from STRICT mutual TLS, and read the reset that a plain client gets
- Read a workload's SPIFFE identity in its certificate and in the metrics of the proxy

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 43.1 › Cilium as the cluster network › In practice (line 74) |  |
| `apps.yaml` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 248) |  |
| `try.sh` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 322) |  |
| `l3.yaml` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 353) |  |
| `l4.yaml` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 387) |  |
| `entities.yaml` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 439) |  |
| `deny.yaml` | 43.1 › Cilium policies at layers 3 and 4 › In practice (line 473) |  |
| `l7.yaml` | 43.2 › Cilium policies at layer 7 and for DNS › In practice (line 68) |  |
| `egress.yaml` | 43.2 › Cilium policies at layer 7 and for DNS › In practice (line 125) |  |
| `dns-apps.yaml` | 43.2 › Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 188) |  |
| `flow_check.py` | 43.2 › Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 255) |  |
| `dns-query.yaml` | 43.2 › Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 317) |  |
| `dns-http.yaml` | 43.2 › Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 391) |  |
| `enc.yaml` | 43.2 › Transparent encryption between nodes › In practice (line 503) |  |
| `enc.sh` | 43.2 › Transparent encryption between nodes › In practice (line 547) |  |
| `mesh.yaml` | 43.3 › A service mesh and Istio › In practice (line 144) |  |
| `plain.yaml` | 43.3 › A service mesh and Istio › In practice (line 186) |  |
| `mtry.sh` | 43.3 › Mutual TLS with Istio › In practice (line 263) |  |
| `strict.yaml` | 43.3 › Mutual TLS with Istio › In practice (line 289) |  |
| `ex-echo.yaml` | 43.3 › Try it yourself (line 394) |  |
| `ex-github.yaml` | 43.3 › Try it yourself (line 437) |  |
| `mesh2.yaml` | 43.3 › Try it yourself (line 495) |  |
