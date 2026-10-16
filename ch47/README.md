# 47 - Kubernetes on Azure - AKS, ACR and Workload Identity

The files the chapter **47 - Kubernetes on Azure - AKS, ACR and Workload Identity** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch47`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `app/index.html` | Azure Container Registry: building in the cloud and attaching it › In practice (line 271) |  |
| `app/Dockerfile` | Azure Container Registry: building in the cloud and attaching it › In practice (line 274) |  |
| `web.yaml` | A workload behind an Azure load balancer › In practice (line 334) |  |
| `wi.yaml` | Workload Identity: an Entra identity for a ServiceAccount › In practice (line 508) |  |
