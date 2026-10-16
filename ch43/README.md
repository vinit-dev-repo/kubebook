# 43 - Cilium and a Service Mesh - Cilium Network Policies, Transparent Encryption and Istio Mutual TLS

The files the chapter **43 - Cilium and a Service Mesh - Cilium Network Policies, Transparent Encryption and Istio Mutual TLS** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch43`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Install Cilium on a kind cluster that has no network plugin, and read the status and the facts that it reports
- Write a CiliumNetworkPolicy with endpoints, entities, ports and a deny rule, and read a dropped packet as a timeout
- Allow one HTTP method and path through Envoy, and limit egress to one DNS name
- Switch on transparent encryption between nodes with WireGuard and with IPsec, and read the proof on the nodes
- Say what a service mesh adds to microservices, and install Istio with `istioctl` after a checksum check
- Inject a sidecar with a namespace label, and tell PERMISSIVE from STRICT mutual TLS
- Read a workload's SPIFFE identity in its certificate and in the proxy's metrics

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Cilium as the cluster network › In practice (line 79) |  |
| `apps.yaml` | Cilium policies at layers 3 and 4 › In practice (line 245) |  |
| `try.sh` | Cilium policies at layers 3 and 4 › In practice (line 318) |  |
| `l3.yaml` | Cilium policies at layers 3 and 4 › In practice (line 346) |  |
| `l4.yaml` | Cilium policies at layers 3 and 4 › In practice (line 379) |  |
| `entities.yaml` | Cilium policies at layers 3 and 4 › In practice (line 431) |  |
| `deny.yaml` | Cilium policies at layers 3 and 4 › In practice (line 464) |  |
| `l7.yaml` | Cilium policies at layer 7 and for DNS › In practice (line 516) |  |
| `egress.yaml` | Cilium policies at layer 7 and for DNS › In practice (line 571) |  |
| `dns-apps.yaml` | Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 632) |  |
| `flow_check.py` | Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 699) |  |
| `dns-query.yaml` | Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 761) |  |
| `dns-http.yaml` | Cilium policies at layer 7 and for DNS › Observe one flow, then control DNS questions (line 835) |  |
| `enc.yaml` | Transparent encryption between nodes › In practice (line 942) |  |
| `enc.sh` | Transparent encryption between nodes › In practice (line 986) |  |
| `mesh.yaml` | A service mesh and Istio › In practice (line 1211) |  |
| `plain.yaml` | A service mesh and Istio › In practice (line 1253) |  |
| `mtry.sh` | Mutual TLS with Istio › In practice (line 1319) |  |
| `strict.yaml` | Mutual TLS with Istio › In practice (line 1346) |  |
| `ex-echo.yaml` | Try it yourself (line 1454) |  |
| `ex-github.yaml` | Try it yourself (line 1497) |  |
| `mesh2.yaml` | Try it yourself (line 1555) |  |
