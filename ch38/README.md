# 38 - Workload Security - Security Contexts, Capabilities, Pod Security Standards, Image Security and Secrets at Rest

The files the chapter **38 - Workload Security - Security Contexts, Capabilities, Pod Security Standards, Image Security and Secrets at Rest** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch38`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say who a container runs as, and set the user, the group and the volume group at Pod level and at container level
- Show that a container setting beats a Pod setting, and what `runAsNonRoot`, `allowPrivilegeEscalation` and `readOnlyRootFilesystem` change
- Read a capability set, drop all capabilities, add one back, and say what `privileged: true` gives a container
- Label a namespace with a Pod Security standard, in the modes enforce, warn and audit, and test the label with a dry run
- Write a Pod that passes the `restricted` standard, and read the reasons when a Pod does not
- Test cluster-wide Pod Security defaults, per-mode label overrides and an exact exemption in a separate cluster
- Switch on encryption at rest for Secrets, see the ciphertext prefix in etcd, and rewrite the old Secrets
- Pull an image from a private registry with a pull secret, on a Pod and on a ServiceAccount
- Choose an image pull policy, and explain the check that keeps a Pod from reusing an image that it may not pull
- Run a TLS `ImagePolicyWebhook`, observe allow/deny and cache TTL decisions, and distinguish fail-closed from fail-open for uncached images
- Set a safe sysctl on a Pod, and allow an unsafe one on a node
- Set up two tenants with RBAC, a quota and a network policy, and find the gap in the `edit` role
- Read a KMS v2 provider entry, and what the API server does without its plugin
- Place each control in a 4C layer and in a lifecycle phase

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `hostmix.yaml` | Security contexts › In practice (line 129) |  |
| `ids.yaml` | Security contexts › In practice (line 178) |  |
| `over.yaml` | Security contexts › In practice (line 237) |  |
| `nonroot.yaml` | Security contexts › In practice (line 284) |  |
| `ro.yaml` | Security contexts › In practice (line 318) |  |
| `ngro.yaml` | Security contexts › In practice (line 352) |  |
| `kubebook-ch38-groups-work/Dockerfile` | Security contexts › Keep image-defined groups out of a Pod's identity (line 424) |  |
| `kubebook-ch38-groups-work/groups.yaml` | Security contexts › Keep image-defined groups out of a Pod's identity (line 448) |  |
| `tuned.yaml` | Kernel parameters - sysctls in the Pod security context › In practice (line 611) |  |
| `backlog.yaml` | Kernel parameters - sysctls in the Pod security context › In practice (line 644) |  |
| `wait-kubelet.sh` | Kernel parameters - sysctls in the Pod security context › In practice (line 697) |  |
| `caps.yaml` | Linux capabilities and privileged containers › In practice (line 793) |  |
| `priv.yaml` | Linux capabilities and privileged containers › In practice (line 873) |  |
| `good.yaml` | Pod Security Standards and admission › In practice (line 988) |  |
| `priv2.yaml` | Pod Security Standards and admission › In practice (line 1043) |  |
| `hostpod.yaml` | Pod Security Standards and admission › In practice (line 1072) |  |
| `badweb.yaml` | Pod Security Standards and admission › In practice (line 1105) |  |
| `admission/pod-security.yaml` | Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 1285) |  |
| `admission/audit.yaml` | Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 1305) |  |
| `kind.yaml` | Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 1319) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `specimen.yaml` | Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 1382) |  |
| `verify_psa.py` | Pod Security Standards and admission › Test cluster defaults, label overrides and exemptions (line 1397) |  |
| `tenants.yaml` | Multi-tenancy - one cluster, several teams › In practice (line 1624) |  |
| `policy.yaml` | Multi-tenancy - one cluster, several teams › In practice (line 1664) |  |
| `etcd.sh` | Secrets and encryption at rest › In practice (line 1817) |  |
| `kubebook-encryption.yaml` | Secrets and encryption at rest › In practice (line 1837) |  |
| `wait-apiserver.sh` | Secrets and encryption at rest › In practice (line 1868) |  |
| `kubebook-kms.yaml` | KMS providers - a key kept outside the cluster › In practice (line 2014) |  |
| `kind-registry.yaml` | Private registries and pull secrets › In practice (line 2129) |  |
| `certs/hosts.toml` | Private registries and pull secrets › In practice (line 2197) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `withsecret.yaml` | Private registries and pull secrets › In practice (line 2250) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `cached2.yaml` | Image pull policy and the credential check › In practice (line 2377) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `exr.yaml` | Try it yourself (line 2873) |  |
| `ng2.yaml` | Try it yourself (line 2909) |  |
| `ng3.yaml` | Try it yourself (line 2941) |  |
| `puller.yaml` | Try it yourself (line 3002) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `mixed.yaml` | Try it yourself (line 3034) |  |
| `shm.yaml` | Try it yourself (line 3091) |  |
