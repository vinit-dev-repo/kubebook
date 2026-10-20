# 04 - Objects, Manifests and YAML Mistakes; Finding Fields and What Apply Remembers; Server-Side Apply and Changing a Live Object; Several Objects as Files; Finalizers, the API and Events

The files the chapter **04**, in its parts **04.1 - Objects, Manifests and YAML Mistakes**, **04.2 - Finding Fields and What Apply Remembers**, **04.3 - Server-Side Apply and Changing a Live Object**, **04.4 - Several Objects as Files** and **04.5 - Finalizers, the API and Events**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch04`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Read a manifest as four keys, and name what the server adds to it: a `uid`, defaults in `spec`, and a `status`
- Write YAML that Kubernetes accepts, read the line each of seven kinds of mistake prints, and say who printed it
- Find any field with `kubectl explain`, and any kind with `kubectl api-resources`
- Tell `create`, `replace` and `apply` apart, and say what `apply` remembers and why
- Send a file with server-side apply, read who owns each field in `managedFields`, and resolve a conflict
- Change a live Pod, name the five fields it allows, and use `replace --force` for the rest
- Keep a Deployment and a Service as files in one folder, and preview a change with `kubectl diff`
- Send one patch two ways, and say which one keeps a list entry and which one removes it
- Say what a finalizer does to a deletion, and how owners and the garbage collector delete dependents
- Call the API with `curl` through `kubectl proxy`, and read Events as objects

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `pod.yaml` | 04.1 › An object is a file the server keeps › In practice (line 95) |  |
| `bad3.yaml` | 04.1 › YAML as Kubernetes reads it › In practice (line 408) | written with printf |
| `bad4.yaml` | 04.1 › YAML as Kubernetes reads it › In practice (line 422) |  |
| `ssa.yaml` | 04.3 › Server-side apply, field managers and conflicts › In practice (line 61) |  |
| `ssa-b.yaml` | 04.3 › Server-side apply, field managers and conflicts › In practice (line 93) |  |
| `ssa-size.yaml` | 04.3 › Server-side apply, field managers and conflicts › In practice (line 146) |  |
| `ssa-b2.yaml` | 04.3 › Server-side apply, field managers and conflicts › In practice (line 166) |  |
| `app/deployment.yaml` | 04.4 › Several objects as files › In practice (line 64) |  |
| `app/service.yaml` | 04.4 › Several objects as files › In practice (line 85) |  |
| `keep.yaml` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 247) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `replace.yaml` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 247) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `observer-patch.yaml` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 280) |  |
| `expected-keep.txt` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 324) | written with printf |
| `expected-replace.txt` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 325) | written with printf |
| `toleration-patch.yaml` | 04.4 › Several objects as files › The same patch can preserve or remove a container (line 358) |  |
| `recursive04/root.yaml` | 04.4 › Several objects as files › Check which folders apply reads (line 499) |  |
| `recursive04/nested/leaf.yaml` | 04.4 › Several objects as files › Check which folders apply reads (line 508) |  |
| `fin.yaml` | 04.5 › Finalizers, owners and garbage collection › In practice (line 61) |  |
| `dep.yaml` | 04.5 › Finalizers, owners and garbage collection › In practice (line 138) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-pod.yaml` | 04.5 › Try it yourself (line 442) |  |
| `ex-tab.yaml` | 04.5 › Try it yourself (line 468) | written with printf |
| `ex-ssa.yaml` | 04.5 › Try it yourself (line 565) |  |
| `ex-fin.yaml` | 04.5 › Try it yourself (line 601) |  |
