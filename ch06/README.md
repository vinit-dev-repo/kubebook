# 06 - Phases, States and Restart Policies; Probes and What Happens When They Fail; Stopping a Pod and Reading Logs; Debugging a Pod and Resource Metrics

The files the chapter **06**, in its parts **06.1 - Phases, States and Restart Policies**, **06.2 - Probes and What Happens When They Fail**, **06.3 - Stopping a Pod and Reading Logs** and **06.4 - Debugging a Pod and Resource Metrics**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch06`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Read a Pod's phase, its containers' states and its conditions, and know what the STATUS column of `kubectl get pods` really shows
- Break a Pod with a wrong image and a crashing command, then read each failure with `get`, `describe` and `logs`
- Choose a restart policy, and read the back-off that the name `CrashLoopBackOff` stands for
- Add startup, liveness and readiness probes with the `httpGet`, `tcpSocket` and `exec` checks, and see what each failure does
- Say why a liveness probe checks only the app itself, and what a readiness failure does to a Service
- Stop a Pod with a `preStop` hook, the stop signal and the grace period, and watch a container that ignores the signal
- Read logs with `kubectl logs`, then find the same lines in the files on the node
- Debug a Pod with the drill-down ladder, ending in `kubectl debug` and an ephemeral container
- Install metrics-server and read CPU and memory with `kubectl top`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `policies.yaml` | 06.1 › Restart policies and the back-off › In practice (line 227) |  |
| `thr.yaml` | 06.2 › The three probes and their checks › The idea (line 70) |  |
| `probes.yaml` | 06.2 › The three probes and their checks › In practice (line 106) |  |
| `failing.yaml` | 06.2 › When probes fail › In practice (line 252) |  |
| `hooks.yaml` | 06.3 › Stopping a Pod: hooks, the stop signal and the grace period › In practice (line 66) |  |
| `badhook.yaml` | 06.3 › Stopping a Pod: hooks, the stop signal and the grace period › In practice (line 141) |  |
| `held.yaml` | 06.3 › Stopping a Pod: hooks, the stop signal and the grace period › A waiting status can hide a running process (line 188) |  |
| `shop.yaml` | 06.3 › Logs › In practice (line 387) |  |
| `server.yaml` | 06.4 › Debugging a Pod › Watch one request from an ephemeral container (line 180) |  |
| `ex-ready.yaml` | 06.4 › Try it yourself (line 472) |  |
| `ex-hook.yaml` | 06.4 › Try it yourself (line 514) |  |
