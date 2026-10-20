# 20 - Plans, Images and Two Web Apps behind Nginx; The Voting App - Five Parts in One File; When a Part Goes Away, Looking Back and the Exercises

The files the chapter **20**, in its parts **20.1 - Plans, Images and Two Web Apps behind Nginx**, **20.2 - The Voting App - Five Parts in One File** and **20.3 - When a Part Goes Away, Looking Back and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch20`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Plan an application made of several Deployments: which part needs a Service, which part needs none, and how the parts find each other by name
- Build the book's own small Node images, load several of them into kind, and say why a real cluster needs a registry
- Connect two Deployments through a Service name, read the name turning into the Service's address, and read the failure when the backend is gone
- Rebuild a five-part voting application with readiness probes that depend on their backends, a worker that retries, and a database on a claim
- Post a vote from a Pod and from your own machine, and follow it through Redis and the worker into Postgres
- Take Redis away and then Postgres, and read what the Pods and the EndpointSlice say while no vote is lost
- Roll out a new worker image with `set image`, read the history, and look back over Parts I to IV
- Run the six exercises of the chapter and delete its cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 20.1 › Planning several Deployments › In practice (line 89) |  |
| `hello/server.mjs` | 20.1 › Building the book's own images and loading them › In practice (line 160) |  |
| `webnginx/server.mjs` | 20.1 › Building the book's own images and loading them › In practice (line 181) |  |
| `hello/Dockerfile` | 20.1 › Building the book's own images and loading them › In practice (line 210) |  |
| `nginx-conf.yaml` | 20.1 › Two web apps behind nginx: talking by name › In practice (line 286) |  |
| `apps.yaml` | 20.1 › Two web apps behind nginx: talking by name › In practice (line 300) | the chapter adds to it in later blocks |
| `vote/server.mjs` | 20.2 › The voting app: five parts, one file › In practice (line 89) |  |
| `worker/worker.mjs` | 20.2 › The voting app: five parts, one file › In practice (line 132) |  |
| `result/server.mjs` | 20.2 › The voting app: five parts, one file › In practice (line 185) |  |
| `vote/package.json` | 20.2 › The voting app: five parts, one file › In practice (line 213) |  |
| `worker/package.json` | 20.2 › The voting app: five parts, one file › In practice (line 216) |  |
| `result/package.json` | 20.2 › The voting app: five parts, one file › In practice (line 219) |  |
| `vote/Dockerfile` | 20.2 › The voting app: five parts, one file › In practice (line 223) |  |
| `worker/Dockerfile` | 20.2 › The voting app: five parts, one file › In practice (line 223) |  |
| `result/Dockerfile` | 20.2 › The voting app: five parts, one file › In practice (line 223) |  |
| `voting.yaml` | 20.2 › The voting app: five parts, one file › In practice (line 272) | the chapter adds to it in later blocks |
| `ex2.yaml` | 20.3 › Try it yourself (line 367) |  |
| `ex3.yaml` | 20.3 › Try it yourself (line 451) |  |
| `ex4.yaml` | 20.3 › Try it yourself (line 504) |  |
| `ex5.yaml` | 20.3 › Try it yourself (line 594) |  |
| `ex6.yaml` | 20.3 › Try it yourself (line 696) |  |
