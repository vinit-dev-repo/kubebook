# 35 - Custom Resources, Custom Controllers and Operators; Admission Control, Admission Policies and Webhooks; API Versions and Deprecations

The files the chapter **35**, in its parts **35.1 - Custom Resources, Custom Controllers and Operators**, **35.2 - Admission Control, Admission Policies and Webhooks** and **35.3 - API Versions and Deprecations**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch35`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Add a new kind to the API with a CustomResourceDefinition, and give it a schema, defaults, printer columns and a status subresource
- Find where a custom object lives in etcd, and see why its status needs its own subresource
- Run a small custom controller that makes a ConfigMap for each custom object, with a Role that holds only the rights it needs
- Explain how an operator joins custom resources with a controller, and what the Operator Framework, OLM and OperatorHub add
- Follow a request through the mutating and validating admission phases, list the default plugins and switch one on
- Refuse a request with a ValidatingAdmissionPolicy, change one with a MutatingAdmissionPolicy, and find the gaps in both
- Run a validating webhook over TLS, and see what `failurePolicy` does when the webhook is down
- Change a native mutation default through a ConfigMap, preserve existing and explicit values, and diagnose a missing parameter
- Find the versions an API group serves, tell the preferred version from the storage version, and move an old manifest with kubectl-convert

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `hello.yaml` | 35.1 › Custom resources and CRDs › In practice (line 111) |  |
| `crd.yaml` | 35.1 › Custom resources and CRDs › In practice (line 139) |  |
| `bad1.yaml` | 35.1 › Custom resources and CRDs › In practice (line 239) |  |
| `bad2.yaml` | 35.1 › Custom resources and CRDs › In practice (line 264) |  |
| `etcd.sh` | 35.1 › Custom resources and CRDs › In practice (line 330) |  |
| `controller.py` | 35.1 › Custom controllers › In practice (line 386) |  |
| `rbac.yaml` | 35.1 › Custom controllers › In practice (line 437) |  |
| `controller.yaml` | 35.1 › Custom controllers › In practice (line 479) |  |
| `pair.yaml` | 35.1 › Operators › In practice (line 636) |  |
| `pvc.yaml` | 35.2 › Admission control › In practice (line 122) |  |
| `wait-apiserver.sh` | 35.2 › Admission control › In practice (line 162) |  |
| `vap.yaml` | 35.2 › Admission policies and webhooks › In practice (line 280) |  |
| `map.yaml` | 35.2 › Admission policies and webhooks › In practice (line 401) |  |
| `map-fixed.yaml` | 35.2 › Admission policies and webhooks › In practice (line 458) |  |
| `webhook.py` | 35.2 › Admission policies and webhooks › Try an external mutating webhook (line 713) | rewritten later in the chapter |
| `webhook.yaml` | 35.2 › Admission policies and webhooks › In practice (line 575) |  |
| `vwc.yaml` | 35.2 › Admission policies and webhooks › In practice (line 630) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `mwc.yaml` | 35.2 › Admission policies and webhooks › Try an external mutating webhook (line 823) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `policy.yaml` | 35.2 › Admission policies and webhooks › Change a parameter without rewriting the policy (line 1021) |  |
| `storage-form.sh` | 35.3 › API versions and deprecations › Move stored Greetings before retiring v1 (line 199) |  |
| `migration-old.yaml` | 35.3 › API versions and deprecations › Move stored Greetings before retiring v1 (line 206) |  |
| `migration-new.yaml` | 35.3 › API versions and deprecations › Move stored Greetings before retiring v1 (line 244) |  |
| `old.yaml` | 35.3 › API versions and deprecations › Convert a removed Deployment API (line 386) |  |
| `vap-secret.yaml` | 35.3 › Try it yourself (line 586) |  |
| `leak.yaml` | 35.3 › Try it yourself (line 611) |  |
| `fine.yaml` | 35.3 › Try it yourself (line 619) |  |
