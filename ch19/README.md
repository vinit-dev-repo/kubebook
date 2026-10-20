# 19 - The Open Network, Enforcement and the Default Deny; Allow Rules, Selectors and AND versus OR; Egress, DNS and the Metadata Address; Edges, Debugging and the Exercises

The files the chapter **19**, in its parts **19.1 - The Open Network, Enforcement and the Default Deny**, **19.2 - Allow Rules, Selectors and AND versus OR**, **19.3 - Egress, DNS and the Metadata Address** and **19.4 - Edges, Debugging and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch19`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Explain why every Pod can reach every other Pod in a new cluster, and what a NetworkPolicy changes
- Read on a kind cluster that kindnet enforces policies, and why a plugin that does not enforce them makes a policy do nothing
- Isolate a namespace with a default deny, and read what the deny blocks and what it leaves alone
- Allow traffic by Pod label, namespace label, namespace name or address range, on a port number, a port name or a port range
- Tell an AND from an OR in a `from` list, and watch one label change flip the result
- Write egress rules with the DNS rule first, and read how `policyTypes` is filled in
- Keep Pods away from the node's metadata address with an egress `ipBlock` and an `except`, on a stand-in made on one node
- Meet the edges: `hostNetwork` Pods, open connections, four refusals, other network plugins and a debugging checklist
- Run the seven exercises of the chapter and delete its cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 19.1 › Open by default, and who enforces the rules › In practice (line 70) |  |
| `stage.yaml` | 19.1 › Open by default, and who enforces the rules › In practice (line 104) |  |
| `try.sh` | 19.1 › Open by default, and who enforces the rules › In practice (line 251) |  |
| `deny-ingress.yaml` | 19.1 › Isolation and the default deny › In practice (line 343) |  |
| `deny-ingress-empty.yaml` | 19.1 › Isolation and the default deny › In practice (line 420) |  |
| `deny-all.yaml` | 19.1 › Isolation and the default deny › In practice (line 448) |  |
| `allow-front-to-web.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 64) |  |
| `allow-ops-namespace.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 135) |  |
| `allow-by-name.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 171) |  |
| `allow-ipblock.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 205) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `allow-nothing.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 242) |  |
| `allow-all-api.yaml` | 19.2 › Allow rules: from, to, ports and how they add up › In practice (line 269) |  |
| `allow-ops-frontend.yaml` | 19.2 › AND versus OR in a from list › In practice (line 362) |  |
| `allow-ops-or-backend.yaml` | 19.2 › AND versus OR in a from list › In practice (line 383) |  |
| `deny-egress-front.yaml` | 19.3 › Egress: DNS first, then the rest › In practice (line 65) |  |
| `allow-front-egress.yaml` | 19.3 › Egress: DNS first, then the rest › In practice (line 100) |  |
| `allow-internet.yaml` | 19.3 › Egress: DNS first, then the rest › In practice (line 175) |  |
| `ingress-only.yaml` | 19.3 › Egress: DNS first, then the rest › In practice (line 239) |  |
| `meta.yaml` | 19.3 › Protecting the node's metadata address › In practice (line 332) |  |
| `meta.sh` | 19.3 › Protecting the node's metadata address › In practice (line 409) |  |
| `no-metadata.yaml` | 19.3 › Protecting the node's metadata address › In practice (line 431) |  |
| `hostnet.yaml` | 19.4 › Edges: hostNetwork, open connections, refusals, other plugins and debugging › In practice (line 69) |  |
| `allow-worker2.yaml` | 19.4 › Edges: hostNetwork, open connections, refusals, other plugins and debugging › In practice (line 105) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-stage.yaml` | 19.4 › Try it yourself (line 282) |  |
| `ex-deny.yaml` | 19.4 › Try it yourself (line 362) |  |
| `ex-allow.yaml` | 19.4 › Try it yourself (line 389) |  |
| `ex-ops.yaml` | 19.4 › Try it yourself (line 425) |  |
| `ex-egress.yaml` | 19.4 › Try it yourself (line 456) |  |
| `ex-dns.yaml` | 19.4 › Try it yourself (line 469) |  |
| `ex-and.yaml` | 19.4 › Try it yourself (line 517) |  |
| `ex-net.yaml` | 19.4 › Try it yourself (line 557) |  |
