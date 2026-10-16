# 04 - Manifests and the Kubernetes API - YAML, apiVersion and kind, apply, explain and Events

The files the chapter **04 - Manifests and the Kubernetes API - YAML, apiVersion and kind, apply, explain and Events** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch04`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Read a manifest as four keys, and name what the server adds to it: a `uid`, defaults in `spec`, and a `status`
- Write YAML that Kubernetes accepts, read the line each of seven kinds of mistake prints, and say who printed it
- Find any field with `kubectl explain`, and any kind with `kubectl api-resources`
- Tell `create`, `replace` and `apply` apart, and say what `apply` remembers and why
- Change a live Pod, name the five fields it allows, and use `replace --force` for the rest
- Keep a Deployment and a Service as files in one folder, and preview a change with `kubectl diff`
- Call the API with `curl` through `kubectl proxy`, and read Events as objects

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `pod.yaml` | An object is a file the server keeps › In practice (line 100) |  |
| `bad3.yaml` | YAML as Kubernetes reads it › In practice (line 400) | written with printf |
| `bad4.yaml` | YAML as Kubernetes reads it › In practice (line 415) |  |
| `ssa.yaml` | Server-side apply, field managers and conflicts › In practice (line 829) |  |
| `ssa-b.yaml` | Server-side apply, field managers and conflicts › In practice (line 863) |  |
| `ssa-size.yaml` | Server-side apply, field managers and conflicts › In practice (line 918) |  |
| `ssa-b2.yaml` | Server-side apply, field managers and conflicts › In practice (line 939) |  |
| `app/deployment.yaml` | Several objects as files › In practice (line 1226) |  |
| `app/service.yaml` | Several objects as files › In practice (line 1247) |  |
| `keep.yaml` | Several objects as files › The same patch can preserve or remove a container (line 1415) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `replace.yaml` | Several objects as files › The same patch can preserve or remove a container (line 1415) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `observer-patch.yaml` | Several objects as files › The same patch can preserve or remove a container (line 1448) |  |
| `expected-keep.txt` | Several objects as files › The same patch can preserve or remove a container (line 1493) | written with printf |
| `expected-replace.txt` | Several objects as files › The same patch can preserve or remove a container (line 1494) | written with printf |
| `toleration-patch.yaml` | Several objects as files › The same patch can preserve or remove a container (line 1528) |  |
| `recursive04/root.yaml` | Several objects as files › Check which folders apply reads (line 1671) |  |
| `recursive04/nested/leaf.yaml` | Several objects as files › Check which folders apply reads (line 1680) |  |
| `fin.yaml` | Finalizers, owners and garbage collection › In practice (line 1776) |  |
| `dep.yaml` | Finalizers, owners and garbage collection › In practice (line 1854) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-pod.yaml` | Try it yourself (line 2157) |  |
| `ex-tab.yaml` | Try it yourself (line 2183) | written with printf |
| `ex-ssa.yaml` | Try it yourself (line 2280) |  |
| `ex-fin.yaml` | Try it yourself (line 2316) |  |
