# 30 - Container Runtimes - containerd, the CRI, crictl and CRI-O

The files the chapter **30 - Container Runtimes - containerd, the CRI, crictl and CRI-O** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch30`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Draw the runtime stack from the kubelet down to the container's process, and name the CRI, the shim and the OCI runtime
- Read a node's runtime, its version and its socket, and the containerd configuration inside a kind node
- Run a container with `runc` by hand, from a root filesystem and a `config.json`
- Use `crictl` to look at Pods, containers and images, and say what `ctr` and `docker` each see instead
- Explain why dockershim left Kubernetes in version 1.24, why Docker-built images still run, and how to find a node's runtime
- Create a RuntimeClass, run a Pod with it, and read the two ways it can go wrong
- Give a RuntimeClass a Pod overhead, and find it in the Pod, on the node and in the Pod's cgroup
- Install CRI-O on a Linux host, make a Pod sandbox and a container by hand, and remove it all again

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `runtimeclasses.yaml` | RuntimeClass: a name for a handler › In practice (line 557) |  |
| `rc-pods.yaml` | RuntimeClass: a name for a handler › In practice (line 585) |  |
| `rc-missing.yaml` | RuntimeClass: a name for a handler › In practice (line 637) |  |
| `overhead.yaml` | Pod overhead: the sandbox's own cost › In practice (line 674) |  |
| `overhead-self.yaml` | Pod overhead: the sandbox's own cost › In practice (line 748) |  |
| `crio-crictl` | CRI-O on a Linux host › In practice (line 895) |  |
| `pod.json` | CRI-O on a Linux host › In practice (line 935) |  |
| `ctr.json` | CRI-O on a Linux host › In practice (line 942) |  |
| `fast.yaml` | Try it yourself (line 1108) |  |
| `ex-overhead.yaml` | Try it yourself (line 1171) |  |
