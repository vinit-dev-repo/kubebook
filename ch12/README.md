# 12 - DaemonSets, Jobs and CronJobs

The files the chapter **12 - DaemonSets, Jobs and CronJobs** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch12`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Build a four-node kind cluster, read the taint on its control plane, and list the DaemonSets that kind already runs
- Write a DaemonSet, read the node affinity and tolerations that the controller adds, and watch a deleted Pod return on its node
- Let a DaemonSet onto the control plane with a toleration, narrow it with a node label and a `nodeSelector`, and update it
- Reach a node agent through a Pod hostPort and verify that two clients receive their own node's server identity
- Run a task to its end with a Job, and choose `completions`, `parallelism`, the `Indexed` mode and `suspend`
- Read how a Job fails: `backoffLimit`, the growing wait, `activeDeadlineSeconds` and `ttlSecondsAfterFinished`
- Schedule Jobs with a CronJob, and read its schedule, its three specs, `suspend`, time zone, concurrency policy and history limits
- Choose between a Deployment, a StatefulSet, a DaemonSet, a Job and a CronJob

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | A four-node cluster and the DaemonSets it already runs › In practice (line 72) |  |
| `ds.yaml` | A DaemonSet of your own › In practice (line 177) |  |
| `settle.sh` | A DaemonSet of your own › In practice (line 224) |  |
| `dsroll.yaml` | Rolling a DaemonSet back › In practice (line 566) |  |
| `settle-roll.sh` | Rolling a DaemonSet back › In practice (line 589) |  |
| `agents.yaml` | Reach the agent on the client's own node › Create the per-node HTTP agents (line 711) |  |
| `client-template.yaml` | Reach the agent on the client's own node › Compare two clients with their local servers (line 782) |  |
| `job-bad.yaml` | Jobs: run a task to its end › In practice (line 983) |  |
| `job3.yaml` | Jobs: run a task to its end › In practice (line 1056) |  |
| `jobidx.yaml` | Jobs: run a task to its end › In practice (line 1093) |  |
| `partitions.yaml` | Jobs: run a task to its end › Process a real input partition for each index (line 1154) |  |
| `expected-states.txt` | Jobs: run a task to its end › Process a real input partition for each index (line 1232) | written with printf |
| `expected-receipts.txt` | Jobs: run a task to its end › Process a real input partition for each index (line 1235) | written with printf |
| `jobsusp.yaml` | Jobs: run a task to its end › Start a Job in the suspended state (line 1289) |  |
| `held.yaml` | Jobs: run a task to its end › Suspend active work, then resume with a new Pod (line 1344) |  |
| `task.sh` | Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 1459) |  |
| `helper.sh` | Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 1470) |  |
| `regular.yaml` | Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 1482) |  |
| `native.yaml` | Jobs: run a task to its end › Let a helper observe a result without blocking Job completion (line 1554) |  |
| `jobfail.yaml` | Jobs that fail: back-off, deadlines and cleanup › In practice (line 1662) |  |
| `jobdead.yaml` | Jobs that fail: back-off, deadlines and cleanup › In practice (line 1726) |  |
| `jobrules.yaml` | Pod failure policy: rules for exit codes and Pod conditions › In practice (line 1801) |  |
| `evict.json` | Pod failure policy: rules for exit codes and Pod conditions › In practice (line 1901) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `held-cron.yaml` | CronJobs › Observe Forbid while a scheduled Job is still running (line 2126) |  |
| `ex-ds.yaml` | Try it yourself (line 2361) |  |
| `ex-count.sh` | Try it yourself (line 2384) |  |
| `ex-idx.yaml` | Try it yourself (line 2445) |  |
| `ex-fail.yaml` | Try it yourself (line 2484) |  |
| `ex-slow.yaml` | Try it yourself (line 2543) |  |
| `ex-quit.yaml` | Try it yourself (line 2578) |  |
| `ex-rev.yaml` | Try it yourself (line 2618) |  |
