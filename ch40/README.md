# 40 - Capabilities, seccomp and AppArmor; User Namespaces, gVisor and RuntimeClass; A Smaller Host - What a Node Runs and Listens On

The files the chapter **40**, in its parts **40.1 - Capabilities, seccomp and AppArmor**, **40.2 - User Namespaces, gVisor and RuntimeClass** and **40.3 - A Smaller Host - What a Node Runs and Listens On**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch40`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Show that dropping `NET_RAW` stops `ping`, and name the capability that a raw socket needs
- Write a `Localhost` seccomp profile, put it on a node, and read the refusal and the error for a missing file
- Say what an AppArmor profile is, load one into the host kernel, and name it in a Pod with `appArmorProfile`
- Explain why Docker Desktop rejects every AppArmor Pod, and why a kind node on Linux needs two changes
- Run a Pod with `hostUsers: false` and show that its root is not root on the node
- Say what a user namespace does not protect, and which fields it refuses
- Install gVisor into a kind node and show that its Pod reports another kernel
- Create a RuntimeClass, use it in a Pod, and read the two ways it can go wrong
- List what a node runs, listens on and installs, and remove the setuid bit from four tools it does not need
- Say why a change made by hand to one node does not last, and what to change instead
- Work the exercises of the whole chapter: a seccomp profile, a `restricted` namespace, gVisor, a user namespace and two short explanations

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `ping-pods.yaml` | 40.1 › Capabilities and raw sockets › In practice (line 101) |  |
| `seccomp-no-mkdir.yaml` | 40.1 › seccomp profiles › In practice (line 259) |  |
| `seccomp-missing.yaml` | 40.1 › seccomp profiles › In practice (line 309) |  |
| `aa-reject.yaml` | 40.1 › AppArmor › In practice (line 394) |  |
| `kind-aa.yaml` | 40.1 › AppArmor › In practice (line 430) |  |
| `aa-missing.yaml` | 40.1 › AppArmor › In practice (line 457) |  |
| `kubebook-deny-write.profile` | 40.1 › AppArmor › In practice (line 537) |  |
| `aa-deny.yaml` | 40.1 › AppArmor › In practice (line 574) |  |
| `aa-three.yaml` | 40.1 › AppArmor › In practice (line 628) |  |
| `userns.yaml` | 40.2 › User namespaces › In practice (line 89) |  |
| `userns-hostpath.yaml` | 40.2 › User namespaces › In practice (line 194) |  |
| `userns-hostnet.yaml` | 40.2 › User namespaces › In practice (line 236) |  |
| `gvisor-pods.yaml` | 40.2 › Container sandboxes and gVisor › In practice (line 374) |  |
| `sandboxed-seccomp.yaml` | 40.2 › Container sandboxes and gVisor › In practice (line 471) |  |
| `rc-missing.yaml` | 40.2 › RuntimeClass › In practice (line 550) |  |
| `rc-absent.yaml` | 40.2 › RuntimeClass › In practice (line 588) |  |
| `no-chmod.yaml` | 40.3 › Try it yourself (line 219) |  |
| `restricted-ping.yaml` | 40.3 › Try it yourself (line 265) |  |
| `gvisor-node.sh` | 40.3 › Try it yourself (line 333) |  |
| `gvisor-ex.yaml` | 40.3 › Try it yourself (line 351) |  |
| `userns-ex.yaml` | 40.3 › Try it yourself (line 406) |  |
