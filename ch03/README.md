# 03 - First Steps with kubectl - a Pod, a Deployment and a Service, Imperatively

The files the chapter **03 - First Steps with kubectl - a Pod, a Deployment and a Service, Imperatively** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch03`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Start a one-node kind cluster that maps a host port to a node port, and read the shape of every `kubectl` command
- Create a Pod with `kubectl run`, then read it back with `get`, `describe`, `-o jsonpath`, `-o name`, `-o yaml` and `exec`
- See why a Pod's address answers inside the cluster and never from your own machine
- Create a Deployment, find the ReplicaSet and the labels that tie it to its Pods, and scale it up and down
- Put a ClusterIP Service in front of the Pods and reach it by name and by cluster address
- Build the book's own Node application, load it into kind without a registry, and watch requests spread over four Pods
- Publish it with NodePort and LoadBalancer, see what each one does on kind, and delete everything again

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | The chapter's cluster and the shape of a kubectl command › In practice (line 69) |  |
| `package.json` | The book's own app, loaded into the cluster › In practice (line 680) |  |
| `index.mjs` | The book's own app, loaded into the cluster › In practice (line 691) |  |
| `Dockerfile` | The book's own app, loaded into the cluster › In practice (line 705) |  |
