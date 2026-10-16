# 05 - Pods in Depth - Commands and Arguments, Multi-Container Pods, Init Containers and Sidecars

The files the chapter **05 - Pods in Depth - Commands and Arguments, Multi-Container Pods, Init Containers and Sidecars** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch05`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what the containers of one Pod share, and why more capacity means more Pods and never more containers in one Pod
- Map a Dockerfile's `ENTRYPOINT` and `CMD` to a Pod's `command` and `args`, and read a finished container's exit code
- Run two containers in one Pod that share `localhost` and a folder, and pick one of them with `-c`
- Send a line with `kubectl attach -i` to an already-running container and verify what it wrote
- Reach one Pod from your own machine with `kubectl port-forward`, with no Service in place
- Run init containers in order, and read what a failing one looks like
- Add a native sidecar with `restartPolicy: Always`, and tell it from an init container and from a second regular container
- Change a live Pod with the file round trip, and say why a Deployment is the better place to change anything

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `sleeper/Dockerfile` | A Pod, properly - what its containers share › In practice (line 116) |  |
| `sleepers.yaml` | Commands and arguments - ENTRYPOINT and CMD in a Pod › In practice (line 189) |  |
| `bad-args.yaml` | Commands and arguments - ENTRYPOINT and CMD in a Pod › In practice (line 358) |  |
| `two.yaml` | Two containers in one Pod › In practice (line 406) |  |
| `ch05-attach.yaml` | Two containers in one Pod › Send a line to a running container's standard input (line 561) |  |
| `sees.yaml` | Seeing a sibling's processes, and adding names to a Pod › In practice (line 673) |  |
| `target.yaml` | Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 813) |  |
| `preview.yaml` | Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 839) | a template: the shell fills in $VARIABLES when the chapter runs it; the chapter adds to it in later blocks |
| `peer.yaml` | Seeing a sibling's processes, and adding names to a Pod › Preview a migration in one Pod (line 839) | a template: the shell fills in $VARIABLES when the chapter runs it; the chapter adds to it in later blocks |
| `init.yaml` | Init containers - setup that finishes before the app starts › In practice (line 1089) |  |
| `initfail.yaml` | Init containers - setup that finishes before the app starts › In practice (line 1181) |  |
| `sidecar.yaml` | Sidecar containers - helpers that start first and stop last › In practice (line 1271) |  |
| `initprobe.yaml` | Sidecar containers - helpers that start first and stop last › In practice (line 1349) |  |
| `ex2.yaml` | Try it yourself (line 1552) |  |
| `ex3.yaml` | Try it yourself (line 1577) |  |
| `ex4.yaml` | Try it yourself (line 1612) |  |
| `ex5.yaml` | Try it yourself (line 1645) |  |
| `ex7.yaml` | Try it yourself (line 1708) |  |
