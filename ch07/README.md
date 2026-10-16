# 07 - Organizing Objects - Labels, Selectors, Annotations and Namespaces

The files the chapter **07 - Organizing Objects - Labels, Selectors, Annotations and Namespaces** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch07`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `rs.yaml` | Labels as the glue between objects › In practice (line 370) |  |
| `rsx.yaml` | Labels as the glue between objects › In practice (line 490) |  |
| `ann.yaml` | Annotations › In practice (line 638) |  |
| `ns.yaml` | Namespaces › In practice (line 759) |  |
| `podns.yaml` | Namespaces › In practice (line 837) |  |
| `back-svc.yaml` | Try it yourself (line 1422) |  |
| `front-rs.yaml` | Try it yourself (line 1464) |  |
