# 02 - Choosing a Cluster and Installing the Tools; The First Cluster and kubectl; The kubeconfig File and Contexts; Bigger Clusters, kind's Commands and the Cleanup

The files the chapter **02**, in its parts **02.1 - Choosing a Cluster and Installing the Tools**, **02.2 - The First Cluster and kubectl**, **02.3 - The kubeconfig File and Contexts** and **02.4 - Bigger Clusters, kind's Commands and the Cleanup**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch02`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Compare the ways to get a Kubernetes cluster (minikube, Docker Desktop, kind, kubeadm, kops and the cloud services) and see why this book uses kind
- Install kind and kubectl for real on Windows and on Linux, with pinned versions and a checksum check
- Create a one-node cluster and see that its node is one Docker container
- Read the node, the system Pods and the namespaces with kubectl
- Read a kubeconfig file: clusters, users, contexts and the current context, without printing its secrets
- Run two clusters side by side and switch between them with contexts and namespaces
- Find the file that kubectl reads, and see how a list in `KUBECONFIG` is merged
- Build a three-node cluster, read the config file's other doors, and use kind's export and delete commands; see where load and offline use fit
- Delete the chapter's cluster, and check that no cluster and no context is left

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 02.2 › The first cluster, and what kind built › In practice (line 60) |  |
| `three.yaml` | 02.4 › A three-node cluster and the config file's other doors › In practice (line 57) |  |
| `ex.yaml` | 02.4 › Try it yourself (line 285) |  |
