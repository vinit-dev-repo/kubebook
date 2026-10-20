# 09 - Controllers, ReplicaSets and the Deployment; Rolling Updates, Rollbacks, Pause and Restart; Scaling, Deleting and Disruption Budgets; A Node Failure, Ownership and the Availability Clock

The files the chapter **09**, in its parts **09.1 - Controllers, ReplicaSets and the Deployment**, **09.2 - Rolling Updates, Rollbacks, Pause and Restart**, **09.3 - Scaling, Deleting and Disruption Budgets** and **09.4 - A Node Failure, Ownership and the Availability Clock**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch09`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Explain a controller's reconciliation loop, and read a ReplicaSet and its older relative, the ReplicationController
- Watch a ReplicaSet replace a deleted Pod, scale it by command and by file, and see why a changed template does not touch running Pods
- Follow the chain Deployment, ReplicaSet and Pod through names, labels and owners
- Update a Deployment with `set image`, and read the two ReplicaSets and the events of a rolling update
- Tune a rollout with `maxSurge`, `maxUnavailable`, `minReadySeconds` and `revisionHistoryLimit`, and record a change-cause
- Roll back with `rollout undo`, and see how a bad image leaves the old Pods serving until the progress deadline marks the Deployment as stuck
- Pause a Deployment to collect changes, resume it, and restart it on purpose
- Scale a Deployment, delete it with and without its Pods, and choose where each kind of change belongs
- Limit a drain with a PodDisruptionBudget, and send an eviction yourself
- Follow a ReplicaSet Pod through a failed node and prove the replacement by its UID
- Tell a direct child scale and an omitted `replicas` from a safe handoff of the count
- Tell Ready from Available, and see what restarts the `minReadySeconds` clock

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `rc.yaml` | 09.1 › Controllers: a loop that keeps the count › In practice (line 101) |  |
| `rs.yaml` | 09.1 › Controllers: a loop that keeps the count › In practice (line 145) |  |
| `rs-nosel.yaml` | 09.1 › Controllers: a loop that keeps the count › In practice (line 186) |  |
| `guarded.yaml` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 227) |  |
| `evict.json` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 363) | a template: the shell fills in $VARIABLES when the chapter runs it; rewritten later in the chapter |
| `pdb-twin.yaml` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 349) |  |
| `pdb-max.yaml` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 401) |  |
| `stuck.yaml` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 449) |  |
| `evict-stuck.json` | 09.3 › Disruptions: the PodDisruptionBudget and the Eviction API › In practice (line 489) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-ch09-remaining-work/kind.yaml` | 09.4 › A node failure, replica ownership, and the availability clock › The idea (line 100) |  |
| `kubebook-ch09-remaining-work/failure-rs.yaml` | 09.4 › A node failure, replica ownership, and the availability clock › The idea (line 155) |  |
| `kubebook-ch09-remaining-work/ownership.yaml` | 09.4 › A node failure, replica ownership, and the availability clock › The idea (line 255) |  |
| `kubebook-ch09-remaining-work/availability.yaml` | 09.4 › A node failure, replica ownership, and the availability clock › The idea (line 372) |  |
| `ex-rs.yaml` | 09.4 › Try it yourself (line 550) |  |
| `ex-shop.yaml` | 09.4 › Try it yourself (line 752) |  |
| `ex-evict.json` | 09.4 › Try it yourself (line 789) | a template: the shell fills in $VARIABLES when the chapter runs it |
