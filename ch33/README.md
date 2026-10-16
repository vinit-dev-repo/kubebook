# 33 - Backup, Restore and Monitoring - etcd Snapshots, the Metrics Server and Cluster Logs

The files the chapter **33 - Backup, Restore and Monitoring - etcd Snapshots, the Metrics Server and Cluster Logs** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch33`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Follow a CPU or memory figure from the container runtime and the kubelet through metrics-server to `kubectl top`, and fix metrics-server on kind
- Read object-state metric values, filter unhealthy Pods, and test a timed alert against declared inputs
- Find the logs of a container, a control plane Pod, the kubelet and containerd, and read the CRI log format and the rotation settings
- Export all logs of a kind cluster and see what a node-level logging agent reads
- Take an etcd snapshot, check it, copy it off the node, and find a Secret in it in plain text
- Restore a snapshot in the right order, with the API server stopped, and prove that the old state is back
- Say what `kubectl get all` leaves out, and choose between a snapshot, exported YAML and a backup tool

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | The resource metrics pipeline › In practice (line 73) |  |
| `rules.yml` | Object-state metrics: a query and an alert you can test › In practice (line 295) |  |
| `tests.yml` | Object-state metrics: a query and an alert you can test › In practice (line 308) |  |
| `agent.yaml` | Where cluster logs live › In practice (line 605) |  |
| `etcd.sh` | Backing up etcd › In practice (line 718) |  |
| `node-etcd.sh` | Restoring etcd › In practice (line 846) |  |
| `etcd-ex.sh` | Try it yourself (line 1110) |  |
| `node-etcd-ex.sh` | Try it yourself (line 1172) |  |
