# 41 - Supply Chain Security - Image Scanning, Static Analysis, SBOMs and the Docker Daemon

The files the chapter **41 - Supply Chain Security - Image Scanning, Static Analysis, SBOMs and the Docker Daemon** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch41`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Scan an image with Trivy, read its findings by severity, and turn the exit code into a gate
- Make an SBOM of an image in two formats, and scan the SBOM later
- Score a Pod with kubesec, and find mistakes in a Pod and a Dockerfile with `trivy config`
- Verify a Kubernetes image, a binary and the release SBOM with cosign, and sign an image of your own
- Refuse images by registry and by signature with Kyverno, and by registry with OPA Gatekeeper
- Explain why the Docker socket is root on the host, and run a second daemon with mutual TLS on the Ubuntu machine
- Write a `daemon.json`, check it, and read the three ways the daemon refuses a bad one

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `trivy.sh` | Scanning images for known vulnerabilities › In practice (line 99) |  |
| `cosign.sh` | Scanning images for known vulnerabilities › In practice (line 102) |  |
| `syft.sh` | Scanning images for known vulnerabilities › In practice (line 105) |  |
| `static/pod-bad.yaml` | Static analysis of manifests and Dockerfiles › In practice (line 463) |  |
| `static/pod-good.yaml` | Static analysis of manifests and Dockerfiles › In practice (line 477) |  |
| `static/Dockerfile` | Static analysis of manifests and Dockerfiles › In practice (line 499) |  |
| `static2/Dockerfile` | Static analysis of manifests and Dockerfiles › In practice (line 580) |  |
| `kubectl-tampered` | Signing and verifying images › In practice (line 703) | written with printf |
| `old-policy.yaml` | Admission policies for images › In practice (line 968) |  |
| `vpol.yaml` | Admission policies for images › In practice (line 1004) |  |
| `ivpol.yaml` | Admission policies for images › In practice (line 1076) |  |
| `gk-template.yaml` | Admission policies for images › In practice (line 1195) |  |
| `gk-constraint.yaml` | Admission policies for images › In practice (line 1244) |  |
| `server.ext` | Securing the Docker daemon › In practice (line 1363) | written with printf |
| `client.ext` | Securing the Docker daemon › In practice (line 1367) | written with printf |
| `daemon.json` | Securing the Docker daemon › In practice (line 1520) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `bad.json` | Securing the Docker daemon › In practice (line 1571) | written with printf |
| `pod-step1.yaml` | Try it yourself (line 1702) |  |
| `pod-step2.yaml` | Try it yourself (line 1713) |  |
