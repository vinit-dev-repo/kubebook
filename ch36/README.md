# 36 - Authentication - TLS and Certificates, the Certificates API, kubeconfig and Users

The files the chapter **36 - Authentication - TLS and Certificates, the Certificates API, kubeconfig and Users** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch36`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say how the API server finds out who is calling, and why a Kubernetes cluster has no User object
- Make a CA and a certificate with `openssl`, check a name and a signature, and say what mutual TLS adds
- Read every certificate of a kubeadm cluster: the three CAs, who signs what, and who uses each one toward whom
- Add a user through the Certificates API: a CSR, an approval, a certificate and a kubeconfig file for that user
- Inspect and sign a custom workload CSR, publish its certificate, and verify the TLS Secret and separate CA trust material
- Read, merge and impersonate with kubeconfig files, and keep their key data out of view
- Compare a static token file, a ServiceAccount token and an anonymous request, and read the claims of a token
- Give the kubelets serving certificates from the cluster CA, and run metrics-server with no lab flag
- Walk the API groups, and reach the API through `kubectl proxy`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Who may talk to the API server › In practice (line 81) |  |
| `csr.yaml` | Adding a user with the Certificates API › In practice (line 498) |  |
| `csr2.yaml` | Adding a user with the Certificates API › In practice (line 599) |  |
| `request.yaml` | Signing a workload certificate with a custom signer › Submit a request for the owned Service (line 767) |  |
| `certificate-status.json` | Signing a workload certificate with a custom signer › Issue and publish the certificate (line 895) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubeadm-user.yaml` | A kubeconfig from kubeadm › In practice (line 1137) |  |
| `wait-apiserver.sh` | Tokens › In practice (line 1226) |  |
| `selfreview.sh` | Tokens › In practice (line 1242) |  |
| `jwt.sh` | Tokens › In practice (line 1293) |  |
| `bootstrap-token.yaml` | Bootstrap tokens › In practice (line 1403) |  |
| `robot-secret.yaml` | Choosing an authentication method › In practice (line 1578) |  |
| `kubelet-config.yaml` | Kubelet serving certificates and API groups › In practice (line 1793) | written with echo |
| `wait-flag.sh` | Rotating the cluster CA by hand › In practice (line 1981) |  |
