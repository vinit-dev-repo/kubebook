# 35 - Extending Kubernetes - Custom Resources, Controllers, Operators, Admission Controllers and API Versions

The files the chapter **35 - Extending Kubernetes - Custom Resources, Controllers, Operators, Admission Controllers and API Versions** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch35`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `hello.yaml` | Custom resources and CRDs › In practice (line 112) |  |
| `crd.yaml` | Custom resources and CRDs › In practice (line 137) |  |
| `bad1.yaml` | Custom resources and CRDs › In practice (line 239) |  |
| `bad2.yaml` | Custom resources and CRDs › In practice (line 264) |  |
| `etcd.sh` | Custom resources and CRDs › In practice (line 326) |  |
| `controller.py` | Custom controllers › In practice (line 367) |  |
| `rbac.yaml` | Custom controllers › In practice (line 413) |  |
| `controller.yaml` | Custom controllers › In practice (line 456) |  |
| `pair.yaml` | Operators › In practice (line 601) |  |
| `pvc.yaml` | Admission control › In practice (line 727) |  |
| `wait-apiserver.sh` | Admission control › In practice (line 759) |  |
| `vap.yaml` | Admission policies and webhooks › In practice (line 851) |  |
| `map.yaml` | Admission policies and webhooks › In practice (line 969) |  |
| `map-fixed.yaml` | Admission policies and webhooks › In practice (line 1025) |  |
| `webhook.py` | Admission policies and webhooks › Try an external mutating webhook (line 1269) | rewritten later in the chapter |
| `webhook.yaml` | Admission policies and webhooks › In practice (line 1136) |  |
| `vwc.yaml` | Admission policies and webhooks › In practice (line 1187) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `mwc.yaml` | Admission policies and webhooks › Try an external mutating webhook (line 1379) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `policy.yaml` | Admission policies and webhooks › Change a parameter without rewriting the policy (line 1574) |  |
| `storage-form.sh` | API versions and deprecations › Move stored Greetings before retiring v1 (line 1907) |  |
| `migration-old.yaml` | API versions and deprecations › Move stored Greetings before retiring v1 (line 1914) |  |
| `migration-new.yaml` | API versions and deprecations › Move stored Greetings before retiring v1 (line 1952) |  |
| `old.yaml` | API versions and deprecations › Convert a removed Deployment API (line 2086) |  |
| `vap-secret.yaml` | Try it yourself (line 2284) |  |
| `leak.yaml` | Try it yourself (line 2309) |  |
| `fine.yaml` | Try it yourself (line 2317) |  |
