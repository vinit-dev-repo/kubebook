# 06 - The Pod Lifecycle - Restart Policies, Probes, Logs and Debugging

The files the chapter **06 - The Pod Lifecycle - Restart Policies, Probes, Logs and Debugging** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch06`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Read a Pod's phase, its containers' states and its conditions, and know what the STATUS column of `kubectl get pods` really shows
- Break a Pod with a wrong image and a crashing command, then read each failure with `get`, `describe` and `logs`
- Choose a restart policy, and read the back-off that the name `CrashLoopBackOff` stands for
- Add startup, liveness and readiness probes with the `httpGet`, `tcpSocket` and `exec` checks, and see what each failure does
- Stop a Pod with a `preStop` hook, the stop signal and the grace period, and watch a container that ignores the signal
- Read logs with `kubectl logs`, then find the same lines in the files on the node
- Debug a Pod with the drill-down ladder, ending in `kubectl debug` and an ephemeral container
- Install metrics-server and read CPU and memory with `kubectl top`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `policies.yaml` | Restart policies and the back-off › In practice (line 222) |  |
| `thr.yaml` | The three probes and their checks › The idea (line 347) |  |
| `probes.yaml` | The three probes and their checks › In practice (line 382) |  |
| `failing.yaml` | When probes fail › In practice (line 522) |  |
| `hooks.yaml` | Stopping a Pod: hooks, the stop signal and the grace period › In practice (line 685) |  |
| `badhook.yaml` | Stopping a Pod: hooks, the stop signal and the grace period › In practice (line 765) |  |
| `held.yaml` | Stopping a Pod: hooks, the stop signal and the grace period › A waiting status can hide a running process (line 813) |  |
| `shop.yaml` | Logs › In practice (line 1008) |  |
| `server.yaml` | Debugging a Pod › Watch one request from an ephemeral container (line 1201) |  |
| `ex-ready.yaml` | Try it yourself (line 1491) |  |
| `ex-hook.yaml` | Try it yourself (line 1533) |  |
