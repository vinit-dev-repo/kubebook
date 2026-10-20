# 12 - A Four-Node Cluster, Your Own DaemonSet and Choosing Nodes; Rolling Back a DaemonSet and Reaching Its Agent; Jobs, Completions, Indexes and Suspend; Failing Jobs, Failure Policy and CronJobs

The files the chapter **12**, in its parts **12.1 - A Four-Node Cluster, Your Own DaemonSet and Choosing Nodes**, **12.2 - Rolling Back a DaemonSet and Reaching Its Agent**, **12.3 - Jobs, Completions, Indexes and Suspend** and **12.4 - Failing Jobs, Failure Policy and CronJobs**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch12`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Build a four-node kind cluster, read the taint on its control plane, and list the DaemonSets that kind already runs
- Write a DaemonSet, read the node affinity and tolerations that the controller adds, and watch a deleted Pod return on its node
- Let a DaemonSet onto the control plane with a toleration, narrow it with a node label and a `nodeSelector`, and update it
- Roll a DaemonSet back with `kubectl rollout undo`, read its ControllerRevisions, and see the revision numbers go forward
- Reach a node agent through a Pod hostPort and verify that two clients receive their own node's server identity
- Run a task to its end with a Job, and choose `completions`, `parallelism`, the `Indexed` mode and `suspend`
- Give each index its own input, suspend a running Job, and keep a helper container from blocking completion
- Read how a Job fails: `backoffLimit`, the growing wait, `activeDeadlineSeconds` and `ttlSecondsAfterFinished`
- Make a Job read why a Pod failed with a Pod failure policy, with `FailJob`, `Ignore` and `Count`
- Schedule Jobs with a CronJob, and read its schedule, its three specs, `suspend`, time zone, concurrency policy and history limits
- Choose between a Deployment, a StatefulSet, a DaemonSet, a Job and a CronJob

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 12.1 › A four-node cluster and the DaemonSets it already runs › In practice (line 67) |  |
| `ds.yaml` | 12.1 › A DaemonSet of your own › In practice (line 178) |  |
| `settle.sh` | 12.1 › A DaemonSet of your own › In practice (line 224) |  |
| `dsroll.yaml` | 12.2 › Rolling a DaemonSet back › In practice (line 54) |  |
| `settle-roll.sh` | 12.2 › Rolling a DaemonSet back › In practice (line 77) |  |
| `agents.yaml` | 12.2 › Reach the agent on the client's own node › Create the per-node HTTP agents (line 197) |  |
| `client-template.yaml` | 12.2 › Reach the agent on the client's own node › Compare two clients with their local servers (line 266) |  |
| `job-bad.yaml` | 12.3 › Jobs: run a task to its end › In practice (line 155) |  |
| `job3.yaml` | 12.3 › Jobs: run a task to its end › In practice (line 226) |  |
| `jobidx.yaml` | 12.3 › Jobs: run a task to its end › In practice (line 262) |  |
| `partitions.yaml` | 12.3 › Jobs: run a task to its end › Process a real input partition for each index (line 321) |  |
| `expected-states.txt` | 12.3 › Jobs: run a task to its end › Process a real input partition for each index (line 399) | written with printf |
| `expected-receipts.txt` | 12.3 › Jobs: run a task to its end › Process a real input partition for each index (line 402) | written with printf |
| `jobsusp.yaml` | 12.3 › Jobs: run a task to its end › Start a Job in the suspended state (line 458) |  |
| `held.yaml` | 12.3 › Jobs: run a task to its end › Suspend active work, then resume with a new Pod (line 519) |  |
| `task.sh` | 12.3 › Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 632) |  |
| `helper.sh` | 12.3 › Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 643) |  |
| `regular.yaml` | 12.3 › Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 655) |  |
| `native.yaml` | 12.3 › Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 727) |  |
| `jobfail.yaml` | 12.4 › Jobs that fail: back-off, deadlines and cleanup › In practice (line 72) |  |
| `jobdead.yaml` | 12.4 › Jobs that fail: back-off, deadlines and cleanup › In practice (line 137) |  |
| `jobrules.yaml` | 12.4 › Pod failure policy: rules for exit codes and Pod conditions › In practice (line 220) |  |
| `evict.json` | 12.4 › Pod failure policy: rules for exit codes and Pod conditions › In practice (line 319) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `held-cron.yaml` | 12.4 › CronJobs › Observe Forbid while a scheduled Job is still running (line 554) |  |
| `ex-ds.yaml` | 12.4 › Try it yourself (line 788) |  |
| `ex-count.sh` | 12.4 › Try it yourself (line 811) |  |
| `ex-idx.yaml` | 12.4 › Try it yourself (line 872) |  |
| `ex-fail.yaml` | 12.4 › Try it yourself (line 911) |  |
| `ex-slow.yaml` | 12.4 › Try it yourself (line 970) |  |
| `ex-quit.yaml` | 12.4 › Try it yourself (line 1005) |  |
| `ex-rev.yaml` | 12.4 › Try it yourself (line 1045) |  |
