# 47 - The Azure CLI, an AKS Cluster and a Registry; A Workload behind an Azure Load Balancer, Workload Identity and the Cleanup

The files the chapter **47**, in its parts **47.1 - The Azure CLI, an AKS Cluster and a Registry** and **47.2 - A Workload behind an Azure Load Balancer, Workload Identity and the Cleanup**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch47`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what AKS runs for you, what you still own, and why a cluster makes two resource groups
- Create an AKS cluster with one Azure CLI command, and read its version, tier, OIDC issuer and network mode back
- Say why a region may refuse a new cluster, and what the create block does about it
- Build an image inside Azure with `az acr build`, and let the cluster pull it with no pull Secret
- Reach a Deployment through a Service of type `LoadBalancer`, and say who builds the Azure load balancer rule
- Give a ServiceAccount an Entra identity with Workload Identity, and see that the Pod can do only what its role lists
- Delete one resource group, and prove with four counts that nothing is left to bill

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `app/index.html` | 47.1 › Azure Container Registry: building in the cloud and attaching it › In practice (line 281) |  |
| `app/Dockerfile` | 47.1 › Azure Container Registry: building in the cloud and attaching it › In practice (line 284) |  |
| `web.yaml` | 47.2 › A workload behind an Azure load balancer › In practice (line 76) |  |
| `wi.yaml` | 47.2 › Workload Identity: an Entra identity for a ServiceAccount › In practice (line 258) |  |
