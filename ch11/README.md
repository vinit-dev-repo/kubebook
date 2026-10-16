# 11 - StatefulSets - Stable Names, Ordered Pods and Their Own Storage

The files the chapter **11 - StatefulSets - Stable Names, Ordered Pods and Their Own Storage** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch11`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Name what a StatefulSet promises (a name, an ordinal, a claim of its own and an order) and what it does not promise
- Write a headless Service and a StatefulSet with a claim template, and read the identity each Pod gets
- Look up each Pod by its own DNS name from inside the cluster, and choose the right lookup tool
- Watch a deleted Pod return with the same name, the same claim and the same data
- Scale up and down, see that the highest ordinals go first, and decide what happens to the claims with the retention policy
- Update a StatefulSet from the highest ordinal down, stage an update with `partition`, use `OnDelete`, and repair a stuck rollout
- Use `Parallel`, know which fields cannot change, and delete a StatefulSet with and without its claims
- Test why stable Pod names do not create application membership, quorum or application readiness

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `settle.sh` | What a StatefulSet promises, and what it does not › In practice (line 102) |  |
| `replaced.sh` | What a StatefulSet promises, and what it does not › In practice (line 110) |  |
| `web.yaml` | What a StatefulSet promises, and what it does not › In practice (line 127) |  |
| `kind.yaml` | Replacing a voter and making room for maintenance › In practice (line 883) |  |
| `ex.yaml` | Try it yourself (line 1595) |  |
