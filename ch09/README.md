# 09 - ReplicaSets and Deployments - Scaling, Rolling Updates, Rollbacks and Self-Healing

The files the chapter **09 - ReplicaSets and Deployments - Scaling, Rolling Updates, Rollbacks and Self-Healing** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch09`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Explain a controller's reconciliation loop, and read a ReplicaSet and its older relative, the ReplicationController
- Watch a ReplicaSet replace a deleted Pod, scale it by command and by file, and see why a changed template does not touch running Pods
- Follow the chain Deployment, ReplicaSet and Pod through names, labels and owners
- Update a Deployment with `set image`, and read the two ReplicaSets and the events of a rolling update
- Tune a rollout with `maxSurge`, `maxUnavailable`, `minReadySeconds` and `revisionHistoryLimit`, and record a change-cause
- Roll back with `rollout undo`, and see how a bad image leaves the old Pods serving until the progress deadline marks the Deployment as stuck
- Pause a Deployment to collect changes, resume it, and restart it on purpose
- Scale a Deployment, delete it with and without its Pods, and choose where each kind of change belongs

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `rc.yaml` | Controllers: a loop that keeps the count › In practice (line 106) |  |
| `rs.yaml` | Controllers: a loop that keeps the count › In practice (line 152) |  |
| `rs-nosel.yaml` | Controllers: a loop that keeps the count › In practice (line 193) |  |
| `guarded.yaml` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1100) |  |
| `evict.json` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1240) | a template: the shell fills in $VARIABLES when the chapter runs it; rewritten later in the chapter |
| `pdb-twin.yaml` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1226) |  |
| `pdb-max.yaml` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1278) |  |
| `stuck.yaml` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1327) |  |
| `evict-stuck.json` | Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 1367) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-ch09-remaining-work/kind.yaml` | A node failure, replica ownership, and the availability clock › The idea (line 1538) |  |
| `kubebook-ch09-remaining-work/failure-rs.yaml` | A node failure, replica ownership, and the availability clock › The idea (line 1590) |  |
| `kubebook-ch09-remaining-work/ownership.yaml` | A node failure, replica ownership, and the availability clock › The idea (line 1687) |  |
| `kubebook-ch09-remaining-work/availability.yaml` | A node failure, replica ownership, and the availability clock › The idea (line 1799) |  |
| `ex-rs.yaml` | Try it yourself (line 1980) |  |
| `ex-shop.yaml` | Try it yourself (line 2182) |  |
| `ex-evict.json` | Try it yourself (line 2219) | a template: the shell fills in $VARIABLES when the chapter runs it |
