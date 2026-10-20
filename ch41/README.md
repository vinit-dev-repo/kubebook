# 41 - Scanning Images and SBOMs; Static Analysis and Signed Images; Admission Policies for Images; Securing the Docker Daemon

The files the chapter **41**, in its parts **41.1 - Scanning Images and SBOMs**, **41.2 - Static Analysis and Signed Images**, **41.3 - Admission Policies for Images** and **41.4 - Securing the Docker Daemon**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch41`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Scan an image with Trivy, read its findings by severity, and turn the exit code into a gate
- Read one saved finding, and tell a finding from an incident
- Make an SBOM of an image in two formats, and scan the SBOM later
- Find the image that holds a package and version, and check the hash of the Kubernetes release SBOM
- Score a Pod with kubesec, and find mistakes in a Pod and a Dockerfile with `trivy config`
- Say why a digest names one image where a tag does not, and what a signature adds
- Verify a Kubernetes image, a binary and the release SBOM with cosign
- Sign an image of your own with a key pair, and read the refusals for a moved tag, another key and a wrong password
- Say what an admission check is, and how a policy engine differs from a webhook that you write
- Install Kyverno with Helm, and refuse images by registry with a `ValidatingPolicy` and by signature with an `ImageValidatingPolicy`
- Install OPA Gatekeeper, and write a `ConstraintTemplate` and a Constraint for the same registry rule
- Remove both engines, and name what Helm leaves behind
- Explain why the Docker socket is root on the host, and why a plain TCP port is open to anyone who can reach it
- Run a second daemon with mutual TLS on the Ubuntu machine, and test it with no certificate, a wrong certificate and the right one
- Write a `daemon.json`, check it, and read the three ways the daemon refuses a bad one
- Work the exercises of the whole chapter: a gated scan, an SBOM, a score, a digest policy and a bridge

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `trivy.sh` | 41.1 › Scanning images for known vulnerabilities › In practice (line 88) |  |
| `cosign.sh` | 41.1 › Scanning images for known vulnerabilities › In practice (line 91) |  |
| `syft.sh` | 41.1 › Scanning images for known vulnerabilities › In practice (line 94) |  |
| `static/pod-bad.yaml` | 41.2 › Static analysis of manifests and Dockerfiles › In practice (line 79) |  |
| `static/pod-good.yaml` | 41.2 › Static analysis of manifests and Dockerfiles › In practice (line 93) |  |
| `static/Dockerfile` | 41.2 › Static analysis of manifests and Dockerfiles › In practice (line 115) |  |
| `static2/Dockerfile` | 41.2 › Static analysis of manifests and Dockerfiles › In practice (line 195) |  |
| `kubectl-tampered` | 41.2 › Signing and verifying images › In practice (line 328) | written with printf |
| `old-policy.yaml` | 41.3 › Admission policies for images › In practice (line 116) |  |
| `vpol.yaml` | 41.3 › Admission policies for images › In practice (line 155) |  |
| `ivpol.yaml` | 41.3 › Admission policies for images › In practice (line 229) |  |
| `gk-template.yaml` | 41.3 › Admission policies for images › In practice (line 344) |  |
| `gk-constraint.yaml` | 41.3 › Admission policies for images › In practice (line 392) |  |
| `server.ext` | 41.4 › Securing the Docker daemon › In practice (line 117) | written with printf |
| `client.ext` | 41.4 › Securing the Docker daemon › In practice (line 121) | written with printf |
| `daemon.json` | 41.4 › Securing the Docker daemon › In practice (line 282) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `bad.json` | 41.4 › Securing the Docker daemon › In practice (line 337) | written with printf |
| `pod-step1.yaml` | 41.4 › Try it yourself (line 462) |  |
| `pod-step2.yaml` | 41.4 › Try it yourself (line 473) |  |
