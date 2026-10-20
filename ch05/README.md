# 05 - What a Pod Shares, Commands and Arguments; Two Containers, Attach and Shared Processes; Port-Forward and Init Containers; Sidecars and Editing a Running Pod

The files the chapter **05**, in its parts **05.1 - What a Pod Shares, Commands and Arguments**, **05.2 - Two Containers, Attach and Shared Processes**, **05.3 - Port-Forward and Init Containers** and **05.4 - Sidecars and Editing a Running Pod**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch05`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what the containers of one Pod share, and why more capacity means more Pods and never more containers in one Pod
- Map a Dockerfile's `ENTRYPOINT` and `CMD` to a Pod's `command` and `args`, and read a finished container's exit code
- Run two containers in one Pod that share `localhost` and a folder, and pick one of them with `-c`
- Send a line with `kubectl attach -i` to an already-running container and verify what it wrote
- Share the process namespace of a Pod, and add host names to one Pod with `hostAliases`
- Reach one Pod from your own machine with `kubectl port-forward`, with no Service in place
- Run init containers in order, and read what a failing one looks like
- Add a native sidecar with `restartPolicy: Always`, and tell it from an init container and from a second regular container
- Change a live Pod with the file round trip, and say why a Deployment is the better place to change anything

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `sleeper/Dockerfile` | 05.1 › A Pod, properly - what its containers share › In practice (line 106) |  |
| `sleepers.yaml` | 05.1 › Commands and arguments - ENTRYPOINT and CMD in a Pod › In practice (line 188) |  |
| `bad-args.yaml` | 05.1 › Commands and arguments - ENTRYPOINT and CMD in a Pod › In practice (line 353) |  |
| `two.yaml` | 05.2 › Two containers in one Pod › In practice (line 72) |  |
| `ch05-attach.yaml` | 05.2 › Two containers in one Pod › Send a line to a running container's standard input (line 224) |  |
| `sees.yaml` | 05.2 › Seeing a sibling's processes, and adding names to a Pod › In practice (line 348) |  |
| `target.yaml` | 05.2 › Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 482) |  |
| `preview.yaml` | 05.2 › Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 508) | a template: the shell fills in $VARIABLES when the chapter runs it; the chapter adds to it in later blocks |
| `peer.yaml` | 05.2 › Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 508) | a template: the shell fills in $VARIABLES when the chapter runs it; the chapter adds to it in later blocks |
| `init.yaml` | 05.3 › Init containers - setup that finishes before the app starts › In practice (line 125) |  |
| `initfail.yaml` | 05.3 › Init containers - setup that finishes before the app starts › In practice (line 212) |  |
| `sidecar.yaml` | 05.4 › Sidecar containers - helpers that start first and stop last › In practice (line 64) |  |
| `initprobe.yaml` | 05.4 › Sidecar containers - helpers that start first and stop last › In practice (line 139) |  |
| `ex2.yaml` | 05.4 › Try it yourself (line 346) |  |
| `ex3.yaml` | 05.4 › Try it yourself (line 371) |  |
| `ex4.yaml` | 05.4 › Try it yourself (line 406) |  |
| `ex5.yaml` | 05.4 › Try it yourself (line 439) |  |
| `ex7.yaml` | 05.4 › Try it yourself (line 502) |  |
