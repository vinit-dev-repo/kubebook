# 38 - Security Contexts, Sysctls and Linux Capabilities; Pod Security Standards and Multi-tenancy; Encryption at Rest and KMS Providers; Private Registries, Image Pull Policy and the Layers of Security

The files the chapter **38**, in its parts **38.1 - Security Contexts, Sysctls and Linux Capabilities**, **38.2 - Pod Security Standards and Multi-tenancy**, **38.3 - Encryption at Rest and KMS Providers** and **38.4 - Private Registries, Image Pull Policy and the Layers of Security**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch38`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say who a container runs as, and set the user, the group and the volume group at Pod level and at container level
- Show that a container setting beats a Pod setting, and what `runAsNonRoot`, `allowPrivilegeEscalation` and `readOnlyRootFilesystem` change
- Set a safe sysctl on a Pod, and allow an unsafe one on a node
- Read a capability set, drop all capabilities, add one back, and say what `privileged: true` gives a container
- Label a namespace with a Pod Security standard, in the modes enforce, warn and audit, and test the label with a dry run
- Write a Pod that passes the `restricted` standard, and read the reasons when a Pod does not
- Test cluster-wide Pod Security defaults, per-mode label overrides and an exact exemption in a separate cluster
- Set up two tenants with RBAC, a quota and a network policy, and find the gap in the `edit` role
- Switch on encryption at rest for Secrets, see the ciphertext prefix in etcd, and rewrite the old Secrets
- Read a KMS v2 provider entry, and what the API server does without its plugin
- Pull an image from a private registry with a pull secret, on a Pod and on a ServiceAccount
- Choose an image pull policy, and explain the check that keeps a Pod from reusing an image that it may not pull
- Run a TLS `ImagePolicyWebhook`, observe allow/deny and cache TTL decisions, and distinguish fail-closed from fail-open for uncached images
- Place each control in a 4C layer and in a lifecycle phase

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `hostmix.yaml` | 38.1 › Security contexts › In practice (line 118) |  |
| `ids.yaml` | 38.1 › Security contexts › In practice (line 169) |  |
| `over.yaml` | 38.1 › Security contexts › In practice (line 228) |  |
| `nonroot.yaml` | 38.1 › Security contexts › In practice (line 275) |  |
| `ro.yaml` | 38.1 › Security contexts › In practice (line 308) |  |
| `ngro.yaml` | 38.1 › Security contexts › In practice (line 343) |  |
| `kubebook-ch38-groups-work/Dockerfile` | 38.1 › Security contexts › Keep image-defined groups out of a Pod's identity (line 421) |  |
| `kubebook-ch38-groups-work/groups.yaml` | 38.1 › Security contexts › Keep image-defined groups out of a Pod's identity (line 447) |  |
| `tuned.yaml` | 38.1 › Kernel parameters - sysctls in the Pod security context › In practice (line 616) |  |
| `backlog.yaml` | 38.1 › Kernel parameters - sysctls in the Pod security context › In practice (line 648) |  |
| `wait-kubelet.sh` | 38.1 › Kernel parameters - sysctls in the Pod security context › In practice (line 703) |  |
| `caps.yaml` | 38.1 › Linux capabilities and privileged containers › In practice (line 812) |  |
| `priv.yaml` | 38.1 › Linux capabilities and privileged containers › In practice (line 895) |  |
| `good.yaml` | 38.2 › Pod Security Standards and admission › In practice (line 134) |  |
| `priv2.yaml` | 38.2 › Pod Security Standards and admission › In practice (line 191) |  |
| `hostpod.yaml` | 38.2 › Pod Security Standards and admission › In practice (line 220) |  |
| `badweb.yaml` | 38.2 › Pod Security Standards and admission › In practice (line 254) |  |
| `admission/pod-security.yaml` | 38.2 › Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 443) |  |
| `admission/audit.yaml` | 38.2 › Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 463) |  |
| `kind.yaml` | 38.2 › Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 477) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `specimen.yaml` | 38.2 › Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 540) |  |
| `verify_psa.py` | 38.2 › Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 555) |  |
| `tenants.yaml` | 38.2 › Multi-tenancy - one cluster, several teams › In practice (line 796) |  |
| `policy.yaml` | 38.2 › Multi-tenancy - one cluster, several teams › In practice (line 836) |  |
| `etcd.sh` | 38.3 › Secrets and encryption at rest › In practice (line 84) |  |
| `kubebook-encryption.yaml` | 38.3 › Secrets and encryption at rest › In practice (line 105) |  |
| `wait-apiserver.sh` | 38.3 › Secrets and encryption at rest › In practice (line 137) |  |
| `kubebook-kms.yaml` | 38.3 › KMS providers - a key kept outside the cluster › In practice (line 293) |  |
| `kind-registry.yaml` | 38.4 › Private registries and pull secrets › In practice (line 84) |  |
| `certs/hosts.toml` | 38.4 › Private registries and pull secrets › In practice (line 153) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `withsecret.yaml` | 38.4 › Private registries and pull secrets › In practice (line 206) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `cached2.yaml` | 38.4 › Image pull policy and the credential check › In practice (line 338) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `exr.yaml` | 38.4 › Try it yourself (line 849) |  |
| `ng2.yaml` | 38.4 › Try it yourself (line 885) |  |
| `ng3.yaml` | 38.4 › Try it yourself (line 917) |  |
| `puller.yaml` | 38.4 › Try it yourself (line 978) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `mixed.yaml` | 38.4 › Try it yourself (line 1010) |  |
| `shm.yaml` | 38.4 › Try it yourself (line 1067) |  |
