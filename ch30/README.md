# 30 - The CRI, containerd in a Node, crictl and the End of Dockershim; RuntimeClass, Pod Overhead and CRI-O

The files the chapter **30**, in its parts **30.1 - The CRI, containerd in a Node, crictl and the End of Dockershim** and **30.2 - RuntimeClass, Pod Overhead and CRI-O**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch30`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

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
| `runtimeclasses.yaml` | 30.2 › RuntimeClass: a name for a handler › In practice (line 89) |  |
| `rc-pods.yaml` | 30.2 › RuntimeClass: a name for a handler › In practice (line 118) |  |
| `rc-missing.yaml` | 30.2 › RuntimeClass: a name for a handler › In practice (line 171) |  |
| `overhead.yaml` | 30.2 › Pod overhead: the sandbox's own cost › In practice (line 218) |  |
| `overhead-self.yaml` | 30.2 › Pod overhead: the sandbox's own cost › In practice (line 292) |  |
| `crio-crictl` | 30.2 › CRI-O on a Linux host › In practice (line 448) |  |
| `pod.json` | 30.2 › CRI-O on a Linux host › In practice (line 490) |  |
| `ctr.json` | 30.2 › CRI-O on a Linux host › In practice (line 497) |  |
| `fast.yaml` | 30.2 › Try it yourself (line 670) |  |
| `ex-overhead.yaml` | 30.2 › Try it yourself (line 733) |  |
