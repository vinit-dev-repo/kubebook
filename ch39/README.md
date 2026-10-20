# 39 - CIS Benchmarks, kube-bench and the API Server; The Scheduler and etcd; The Kubelet and Auditing; Ways Around the API Server and Verified Binaries

The files the chapter **39**, in its parts **39.1 - CIS Benchmarks, kube-bench and the API Server**, **39.2 - The Scheduler and etcd**, **39.3 - The Kubelet and Auditing** and **39.4 - Ways Around the API Server and Verified Binaries**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch39`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what a CIS benchmark is, run kube-bench as a Job, and read the PASS, FAIL and WARN lines
- Decide whether a FAIL is a fix or only a question, and close three checks with one flag
- Read the API server's flags and the answers it gives to a caller with no credentials, and turn anonymous access off the safe way
- Set `--kubelet-certificate-authority` safely, with a kubelet serving certificate that you check before you approve it
- Harden the scheduler: give its port a token and a role, turn profiling off, and review each profile's filter plugins
- Show that etcd refuses a caller without a client certificate, and that a certificate from the cluster CA opens nothing
- Run a second etcd by hand under systemd, with TLS and a check of the client certificate
- Compact and defragment etcd, and take the snapshot afterwards
- Read the kubelet's settings and ports, and say which caller gets `401`, `403` or `200`
- Close the kubelet's file-mode and limit gaps, and see `podPidsLimit` stop a fork bomb
- Switch on the audit log, write a policy, and read the events with `jq`
- Match five limited DRA status writes to their audit events, in a separate lab
- Name the four ways to reach the cluster around the API server, none of which the API server can stop
- Show that a direct kubelet call and a direct etcd read leave no audit event
- Verify a downloaded binary against its published SHA-512 hash, and check the binaries that run on a node
- Work the exercises of the whole chapter: kube-bench, an audit policy, a hash check, the kubelet's codes and a short explanation

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `ports.sh` | 39.1 › CIS benchmarks and kube-bench › In practice (line 110) |  |
| `bench.sh` | 39.1 › CIS benchmarks and kube-bench › In practice (line 247) |  |
| `wait-apiserver.sh` | 39.1 › CIS benchmarks and kube-bench › In practice (line 351) |  |
| `wait-static.sh` | 39.1 › CIS benchmarks and kube-bench › In practice (line 367) |  |
| `anon.sh` | 39.1 › Securing the API server › In practice (line 471) |  |
| `kubebook-authn.yaml` | 39.1 › Securing the API server › In practice (line 547) |  |
| `sched-config.yaml` | 39.2 › Securing the scheduler › In practice (line 121) |  |
| `sched-mount.txt` | 39.2 › Securing the scheduler › In practice (line 135) |  |
| `sched-volume.txt` | 39.2 › Securing the scheduler › In practice (line 140) |  |
| `sched-on.sh` | 39.2 › Securing the scheduler › In practice (line 146) |  |
| `plain.sh` | 39.2 › Securing etcd › In practice (line 347) |  |
| `pki.sh` | 39.2 › Securing etcd › In practice (line 380) |  |
| `kubebook-ch39-etcd.service` | 39.2 › Securing etcd › In practice (line 426) |  |
| `hand.sh` | 39.2 › Securing etcd › In practice (line 449) |  |
| `etcd.sh` | 39.2 › Securing etcd › In practice (line 543) |  |
| `audit-policy.yaml` | 39.3 › Auditing › In practice (line 344) |  |
| `audit-mounts.txt` | 39.3 › Auditing › In practice (line 367) |  |
| `audit-volumes.txt` | 39.3 › Auditing › In practice (line 374) |  |
| `audit-on.sh` | 39.3 › Auditing › In practice (line 384) |  |
| `read-audit.sh` | 39.3 › Auditing › In practice (line 453) |  |
| `audit-setup/audit.yaml` | 39.3 › Auditing › Prepare a separate lab (line 614) |  |
| `kind.yaml` | 39.3 › Auditing › Prepare a separate lab (line 627) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-static.yaml` | 39.4 › Ways around the API server › In practice (line 67) |  |
| `bypass-policy.yaml` | 39.4 › Ways around the API server › In practice (line 109) |  |
| `kubebook-etcd-read.sh` | 39.4 › Ways around the API server › In practice (line 167) |  |
| `kubebook-sock.yaml` | 39.4 › Ways around the API server › In practice (line 201) |  |
| `one.txt` | 39.4 › Verifying platform binaries › In practice (line 305) | written with echo |
| `kubectl-changed` | 39.4 › Verifying platform binaries › In practice (line 348) | written with printf |
| `ex-audit-policy.yaml` | 39.4 › Try it yourself (line 476) |  |
| `ex-read.sh` | 39.4 › Try it yourself (line 496) |  |
| `ca2.sh` | 39.4 › Try it yourself (line 537) |  |
