# 07 - Labels and Selectors; Labels as Glue, and Annotations; Namespaces, DNS Names and Switching Fast

The files the chapter **07**, in its parts **07.1 - Labels and Selectors**, **07.2 - Labels as Glue, and Annotations** and **07.3 - Namespaces, DNS Names and Switching Fast**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch07`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Attach labels to objects in a manifest and with `kubectl label`, and follow the rules for their keys and values
- Select objects with equality, set and presence selectors, and with field selectors
- See how a ReplicaSet and a Service find their Pods by label, what a refused selector looks like, and what adoption means
- Record notes with annotations, and know why a selector cannot use them
- Group objects into namespaces, work in one with `-n`, `-A` and the context's namespace, and read the rules for object names
- Reach a Service in another namespace by its DNS name
- Switch namespaces and contexts fast with kubens and kubectx, and delete a namespace with things in it

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `rs.yaml` | 07.2 › Labels as the glue between objects › In practice (line 58) |  |
| `rsx.yaml` | 07.2 › Labels as the glue between objects › In practice (line 174) |  |
| `ann.yaml` | 07.2 › Annotations › In practice (line 322) |  |
| `ns.yaml` | 07.3 › Namespaces › In practice (line 113) |  |
| `podns.yaml` | 07.3 › Namespaces › In practice (line 189) |  |
| `back-svc.yaml` | 07.3 › Try it yourself (line 790) |  |
| `front-rs.yaml` | 07.3 › Try it yourself (line 832) |  |
