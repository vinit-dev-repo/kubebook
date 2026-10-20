# 03 - The Lab Cluster, kubectl and a First Pod; Deployments, Scaling and a Service; Your Own App and the Outside World

The files the chapter **03**, in its parts **03.1 - The Lab Cluster, kubectl and a First Pod**, **03.2 - Deployments, Scaling and a Service** and **03.3 - Your Own App and the Outside World**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch03`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

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
| `kind.yaml` | 03.1 › The chapter's cluster and the shape of a kubectl command › In practice (line 64) |  |
| `package.json` | 03.3 › The book's own app, loaded into the cluster › In practice (line 64) |  |
| `index.mjs` | 03.3 › The book's own app, loaded into the cluster › In practice (line 75) |  |
| `Dockerfile` | 03.3 › The book's own app, loaded into the cluster › In practice (line 89) |  |
