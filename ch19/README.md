# 19 - Network Policies - Who May Talk to Whom

The files the chapter **19 - Network Policies - Who May Talk to Whom** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch19`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Explain why every Pod can reach every other Pod in a new cluster, and what a NetworkPolicy changes
- Read on a kind cluster that kindnet enforces policies, and why a plugin that does not enforce them makes a policy do nothing
- Isolate a namespace with a default deny, and read what the deny blocks and what it leaves alone
- Allow traffic by Pod label, namespace label, namespace name or address range, on a port number, a port name or a port range
- Tell an AND from an OR in a `from` list, and watch one label change flip the result
- Write egress rules with the DNS rule first, and read how `policyTypes` is filled in
- Keep Pods away from the node's metadata address with an egress `ipBlock` and an `except`, on a stand-in made on one node
- Meet the edges: `hostNetwork` Pods, open connections, four refusals, other network plugins and a debugging checklist

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Open by default, and who enforces the rules › In practice (line 74) |  |
| `stage.yaml` | Open by default, and who enforces the rules › In practice (line 106) |  |
| `try.sh` | Open by default, and who enforces the rules › In practice (line 250) |  |
| `deny-ingress.yaml` | Isolation and the default deny › In practice (line 330) |  |
| `deny-ingress-empty.yaml` | Isolation and the default deny › In practice (line 411) |  |
| `deny-all.yaml` | Isolation and the default deny › In practice (line 440) |  |
| `allow-front-to-web.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 503) |  |
| `allow-ops-namespace.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 576) |  |
| `allow-by-name.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 613) |  |
| `allow-ipblock.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 646) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `allow-nothing.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 683) |  |
| `allow-all-api.yaml` | Allow rules: from, to, ports and how they add up › In practice (line 711) |  |
| `allow-ops-frontend.yaml` | AND versus OR in a from list › In practice (line 798) |  |
| `allow-ops-or-backend.yaml` | AND versus OR in a from list › In practice (line 819) |  |
| `deny-egress-front.yaml` | Egress: DNS first, then the rest › In practice (line 930) |  |
| `allow-front-egress.yaml` | Egress: DNS first, then the rest › In practice (line 962) |  |
| `allow-internet.yaml` | Egress: DNS first, then the rest › In practice (line 1036) |  |
| `ingress-only.yaml` | Egress: DNS first, then the rest › In practice (line 1098) |  |
| `meta.yaml` | Protecting the node's metadata address › In practice (line 1181) |  |
| `meta.sh` | Protecting the node's metadata address › In practice (line 1257) |  |
| `no-metadata.yaml` | Protecting the node's metadata address › In practice (line 1278) |  |
| `hostnet.yaml` | Edges: hostNetwork, open connections, refusals, other plugins and debugging › In practice (line 1354) |  |
| `allow-worker2.yaml` | Edges: hostNetwork, open connections, refusals, other plugins and debugging › In practice (line 1391) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-stage.yaml` | Try it yourself (line 1569) |  |
| `ex-deny.yaml` | Try it yourself (line 1649) |  |
| `ex-allow.yaml` | Try it yourself (line 1676) |  |
| `ex-ops.yaml` | Try it yourself (line 1712) |  |
| `ex-egress.yaml` | Try it yourself (line 1743) |  |
| `ex-dns.yaml` | Try it yourself (line 1756) |  |
| `ex-and.yaml` | Try it yourself (line 1804) |  |
| `ex-net.yaml` | Try it yourself (line 1844) |  |
