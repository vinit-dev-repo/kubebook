# 11 - Stable Identity, the Headless Service and Ordered Pods; Scaling, Retention and Application Membership; Replacing a Voter and Making Room for Maintenance; Updates, Parallel and Deleting a StatefulSet

The files the chapter **11**, in its parts **11.1 - Stable Identity, the Headless Service and Ordered Pods**, **11.2 - Scaling, Retention and Application Membership**, **11.3 - Replacing a Voter and Making Room for Maintenance** and **11.4 - Updates, Parallel and Deleting a StatefulSet**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch11`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Name what a StatefulSet promises (a name, an ordinal, a claim of its own and an order) and what it does not promise
- Write a headless Service and a StatefulSet with a claim template, and read the identity each Pod gets
- Look up each Pod by its own DNS name from inside the cluster, and choose the right lookup tool
- Watch a deleted Pod return with the same name, the same claim and the same data
- Scale up and down, see that the highest ordinals go first, and decide what happens to the claims with the retention policy
- Test why stable Pod names do not create application membership, quorum or application readiness
- Replace a lost voter with a new member that joins as a learner, and promote it after it has caught up
- See a Pod that cannot run away from its local volume, and read what a PodDisruptionBudget can refuse
- Update a StatefulSet from the highest ordinal down, stage an update with `partition`, use `OnDelete`, and repair a stuck rollout
- Use `Parallel`, know which fields cannot change, and delete a StatefulSet with and without its claims

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `settle.sh` | 11.1 › What a StatefulSet promises, and what it does not › In practice (line 105) |  |
| `replaced.sh` | 11.1 › What a StatefulSet promises, and what it does not › In practice (line 113) |  |
| `web.yaml` | 11.1 › What a StatefulSet promises, and what it does not › In practice (line 131) |  |
| `kind.yaml` | 11.3 › Replacing a voter and making room for maintenance › In practice (line 90) |  |
| `ex.yaml` | 11.4 › Try it yourself (line 454) |  |
