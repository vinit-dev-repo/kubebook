# 36 - Who May Talk to the API Server, TLS and Certificates and the Cluster PKI; Adding a User with the Certificates API and a Custom Signer; kubeconfig Files, the kubeadm kubeconfig, Tokens and Bootstrap Tokens; Choosing a Method, Kubelet Serving Certificates and Rotating the CA

The files the chapter **36**, in its parts **36.1 - Who May Talk to the API Server, TLS and Certificates and the Cluster PKI**, **36.2 - Adding a User with the Certificates API and a Custom Signer**, **36.3 - kubeconfig Files, the kubeadm kubeconfig, Tokens and Bootstrap Tokens** and **36.4 - Choosing a Method, Kubelet Serving Certificates and Rotating the CA**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch36`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say how the API server finds out who is calling, and why a Kubernetes cluster has no User object
- Make a CA and a certificate with `openssl`, check a name and a signature, and say what mutual TLS adds
- Read every certificate of a kubeadm cluster: the three CAs, who signs what, and who uses each one toward whom
- Add a user through the Certificates API: a CSR, an approval, a certificate and a kubeconfig file for that user
- Inspect and sign a custom workload CSR, publish its certificate, and verify the TLS Secret and separate CA trust material
- Read, merge and impersonate with kubeconfig files, and keep their key data out of view
- Make a kubeconfig for one more user with `kubeadm kubeconfig user`, and see what that road leaves out
- Compare a static token file, a ServiceAccount token and an anonymous request, and read the claims of a token
- Make a bootstrap token, see how a joining node uses it, and see what ends it
- Choose among the methods and read which ones the API server has switched on, with an authenticating proxy and a legacy token Secret
- Walk the API groups, and reach the API through `kubectl proxy`
- Give the kubelets serving certificates from the cluster CA, and run metrics-server with no lab flag
- Rotate the cluster CA by hand, with a bundle of both CAs, a new signer and the removal of the old CA

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 36.1 › Who may talk to the API server › In practice (line 76) |  |
| `csr.yaml` | 36.2 › Adding a user with the Certificates API › In practice (line 82) |  |
| `csr2.yaml` | 36.2 › Adding a user with the Certificates API › In practice (line 181) |  |
| `request.yaml` | 36.2 › Signing a workload certificate with a custom signer › Submit a request for the owned Service (line 361) |  |
| `certificate-status.json` | 36.2 › Signing a workload certificate with a custom signer › Issue and publish the certificate (line 486) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubeadm-user.yaml` | 36.3 › A kubeconfig from kubeadm › In practice (line 183) |  |
| `wait-apiserver.sh` | 36.3 › Tokens › In practice (line 285) |  |
| `selfreview.sh` | 36.3 › Tokens › In practice (line 301) |  |
| `jwt.sh` | 36.3 › Tokens › In practice (line 358) |  |
| `bootstrap-token.yaml` | 36.3 › Bootstrap tokens › In practice (line 480) |  |
| `robot-secret.yaml` | 36.4 › Choosing an authentication method › In practice (line 127) |  |
| `kubelet-config.yaml` | 36.4 › Kubelet serving certificates and API groups › In practice (line 356) | written with echo |
| `wait-flag.sh` | 36.4 › Rotating the cluster CA by hand › In practice (line 556) |  |
