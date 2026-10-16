# 44 - From Laptop to Production - Choosing a Cluster, Load Balancers, and HTTPS with cert-manager

The files the chapter **44 - From Laptop to Production - Choosing a Cluster, Load Balancers, and HTTPS with cert-manager** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch44`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say where a production cluster can run, and what you still operate yourself with kubeadm, kops and a managed service
- Download a Helm chart as a file, check its hash, read it with `helm show`, and install it with your own values
- Give a kind cluster a load balancer with cloud-provider-kind, and put Traefik behind it as the ingress controller
- Say what cert-manager adds to a cluster, and build a private certificate authority from a ClusterIssuer and a Certificate
- Get a certificate for an Ingress from one annotation, and check the HTTPS answer from a Pod that trusts only your authority
- Force a new certificate, and read how cert-manager renews one by itself
- Explain the ACME HTTP-01 challenge, and what changes when the issuer is Let's Encrypt
- Remove cert-manager in the right order, and say why its definitions stay behind

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `charts.sha256` | Charts from a file with Helm › In practice (line 161) |  |
| `app.yaml` | A load balancer and an ingress controller › In practice (line 336) |  |
| `ingress.yaml` | A load balancer and an ingress controller › In practice (line 399) |  |
| `issuers.yaml` | cert-manager and issuers › In practice (line 483) |  |
| `ingress-tls.yaml` | A certificate for an Ingress › In practice (line 582) |  |
| `ex-api.yaml` | Try it yourself (line 901) |  |
| `redirect.yaml` | Try it yourself (line 942) |  |
