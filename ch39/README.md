# 39 - Cluster Hardening - CIS Benchmarks, the API Server, etcd and the Kubelet, Auditing and Verified Binaries

The files the chapter **39 - Cluster Hardening - CIS Benchmarks, the API Server, etcd and the Kubelet, Auditing and Verified Binaries** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch39`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what a CIS benchmark is, run kube-bench as a Job, and read the PASS, FAIL and WARN lines
- Decide whether a FAIL is a fix or only a question, and close three checks with one flag
- Read the API server's flags and the answers it gives to a caller with no credentials, and turn anonymous access off the safe way
- Show that etcd refuses a caller without a client certificate, run a second etcd by hand under systemd, and compact and defragment etcd
- Read the kubelet's settings and ports, close its file-mode and limit gaps, and see why its serving certificate matters
- Switch on the audit log, write a policy, and read the events with `jq`
- Verify a downloaded binary against its published SHA-512 hash, and check the binaries that run on a node
- Harden the scheduler and name the four ways to reach the cluster around the API server, none of which the API server can stop

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `ports.sh` | CIS benchmarks and kube-bench › In practice (line 112) |  |
| `bench.sh` | CIS benchmarks and kube-bench › In practice (line 252) |  |
| `wait-apiserver.sh` | CIS benchmarks and kube-bench › In practice (line 349) |  |
| `wait-static.sh` | CIS benchmarks and kube-bench › In practice (line 365) |  |
| `anon.sh` | Securing the API server › In practice (line 456) |  |
| `kubebook-authn.yaml` | Securing the API server › In practice (line 529) |  |
| `sched-config.yaml` | Securing the scheduler › In practice (line 859) |  |
| `sched-mount.txt` | Securing the scheduler › In practice (line 873) |  |
| `sched-volume.txt` | Securing the scheduler › In practice (line 878) |  |
| `sched-on.sh` | Securing the scheduler › In practice (line 884) |  |
| `plain.sh` | Securing etcd › In practice (line 1066) |  |
| `pki.sh` | Securing etcd › In practice (line 1096) |  |
| `kubebook-ch39-etcd.service` | Securing etcd › In practice (line 1138) |  |
| `hand.sh` | Securing etcd › In practice (line 1161) |  |
| `etcd.sh` | Securing etcd › In practice (line 1249) |  |
| `audit-policy.yaml` | Auditing › In practice (line 1526) |  |
| `audit-mounts.txt` | Auditing › In practice (line 1549) |  |
| `audit-volumes.txt` | Auditing › In practice (line 1556) |  |
| `audit-on.sh` | Auditing › In practice (line 1566) |  |
| `read-audit.sh` | Auditing › In practice (line 1631) |  |
| `audit-setup/audit.yaml` | Auditing › Prepare a separate lab (line 1785) |  |
| `kind.yaml` | Auditing › Prepare a separate lab (line 1798) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-static.yaml` | Ways around the API server › In practice (line 1986) |  |
| `bypass-policy.yaml` | Ways around the API server › In practice (line 2026) |  |
| `kubebook-etcd-read.sh` | Ways around the API server › In practice (line 2084) |  |
| `kubebook-sock.yaml` | Ways around the API server › In practice (line 2118) |  |
| `one.txt` | Verifying platform binaries › In practice (line 2211) | written with echo |
| `kubectl-changed` | Verifying platform binaries › In practice (line 2253) | written with printf |
| `ex-audit-policy.yaml` | Try it yourself (line 2390) |  |
| `ex-read.sh` | Try it yourself (line 2410) |  |
| `ca2.sh` | Try it yourself (line 2451) |  |
