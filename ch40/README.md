# 40 - Node and Runtime Hardening - AppArmor, seccomp, gVisor and RuntimeClass

The files the chapter **40 - Node and Runtime Hardening - AppArmor, seccomp, gVisor and RuntimeClass** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch40`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Show that dropping `NET_RAW` stops `ping`, and name the capability that a raw socket needs
- Write a `Localhost` seccomp profile, put it on a node, and read the refusal and the error for a missing file
- Say what an AppArmor profile is, load one into the host kernel, and name it in a Pod with `appArmorProfile`
- Explain why Docker Desktop rejects every AppArmor Pod, and why a kind node on Linux needs two changes
- Run a Pod with `hostUsers: false` and show that its root is not root on the node
- Install gVisor into a kind node and show that its Pod reports another kernel
- Create a RuntimeClass, use it in a Pod, and read the two ways it can go wrong
- List what a node runs, listens on and installs, and remove the setuid bit from four tools it does not need

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `ping-pods.yaml` | Capabilities and raw sockets › In practice (line 104) |  |
| `seccomp-no-mkdir.yaml` | seccomp profiles › In practice (line 249) |  |
| `seccomp-missing.yaml` | seccomp profiles › In practice (line 298) |  |
| `aa-reject.yaml` | AppArmor › In practice (line 366) |  |
| `kind-aa.yaml` | AppArmor › In practice (line 400) |  |
| `aa-missing.yaml` | AppArmor › In practice (line 427) |  |
| `kubebook-deny-write.profile` | AppArmor › In practice (line 499) |  |
| `aa-deny.yaml` | AppArmor › In practice (line 536) |  |
| `aa-three.yaml` | AppArmor › In practice (line 589) |  |
| `userns.yaml` | User namespaces › In practice (line 729) |  |
| `userns-hostpath.yaml` | User namespaces › In practice (line 833) |  |
| `userns-hostnet.yaml` | User namespaces › In practice (line 875) |  |
| `gvisor-pods.yaml` | Container sandboxes and gVisor › In practice (line 1006) |  |
| `sandboxed-seccomp.yaml` | Container sandboxes and gVisor › In practice (line 1103) |  |
| `rc-missing.yaml` | RuntimeClass › In practice (line 1174) |  |
| `rc-absent.yaml` | RuntimeClass › In practice (line 1212) |  |
| `no-chmod.yaml` | Try it yourself (line 1425) |  |
| `restricted-ping.yaml` | Try it yourself (line 1471) |  |
| `gvisor-node.sh` | Try it yourself (line 1539) |  |
| `gvisor-ex.yaml` | Try it yourself (line 1557) |  |
| `userns-ex.yaml` | Try it yourself (line 1612) |  |
