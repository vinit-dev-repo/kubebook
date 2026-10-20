# 45 - A Google Cloud Project, an Autopilot Cluster, a Registry and the Application; HTTPS with Traefik and cert-manager, a Deployment Workflow and Cleaning Up

The files the chapter **45**, in its parts **45.1 - A Google Cloud Project, an Autopilot Cluster, a Registry and the Application** and **45.2 - HTTPS with Traefik and cert-manager, a Deployment Workflow and Cleaning Up**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch45`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what a Google Cloud project, a billing account, an API and a quota are, and read the CPU quota that limits your project
- Create a GKE Autopilot cluster with one command, and read its version, channel and label back
- Make a registry in Artifact Registry, tag images with the git commit, and push them with a short-lived token
- Deploy the book's multi-container application, and give every container a request that fits Autopilot and the project's quotas
- Put Traefik and cert-manager on the cluster, and get a Let's Encrypt staging certificate for an sslip.io name
- Change production by hand with a new commit, a new tag, `kubectl set image` and `rollout status`
- Write the same flow as a GitHub Actions workflow that signs in with no key file
- Delete everything in an order that leaves no disk, no load balancer and no repository behind

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `charts.sha256` | 45.2 › HTTPS with Traefik, cert-manager and Let's Encrypt staging › In practice (line 74) |  |
| `staging.yaml` | 45.2 › HTTPS with Traefik, cert-manager and Let's Encrypt staging › In practice (line 164) |  |
| `ingress.yaml` | 45.2 › HTTPS with Traefik, cert-manager and Let's Encrypt staging › In practice (line 193) |  |
| `.github/workflows/deploy.yml` | 45.2 › A deployment workflow, by hand and in a pipeline › In practice (line 456) |  |
