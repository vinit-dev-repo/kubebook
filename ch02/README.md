# 02 - The Book's Lab - kind on Windows and Linux, kubectl, kubeconfig and Contexts

The files the chapter **02 - The Book's Lab - kind on Windows and Linux, kubectl, kubeconfig and Contexts** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch02`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Compare the ways to get a Kubernetes cluster (minikube, Docker Desktop, kind, kubeadm, kops and the cloud services) and see why this book uses kind
- Install kind and kubectl for real on Windows and on Linux, with pinned versions and a checksum check
- Create a one-node cluster and see that its node is one Docker container
- Read the node, the system Pods and the namespaces with kubectl
- Read a kubeconfig file: clusters, users, contexts and the current context, without printing its secrets
- Run two clusters side by side and switch between them with contexts and namespaces
- Build a three-node cluster, read the config file's other doors, and use kind's export and delete commands; see where load and offline use fit

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | The first cluster, and what kind built › In practice (line 218) |  |
| `three.yaml` | A three-node cluster and the config file's other doors › In practice (line 603) |  |
| `ex.yaml` | Try it yourself (line 808) |  |
