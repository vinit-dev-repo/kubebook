# 20 - Several Deployments Together - Two Web Apps behind Nginx, and the Voting App

The files the chapter **20 - Several Deployments Together - Two Web Apps behind Nginx, and the Voting App** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch20`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Plan an application made of several Deployments: which part needs a Service, which part needs none, and how the parts find each other by name
- Build the book's own small Node images, load several of them into kind, and say why a real cluster needs a registry
- Connect two Deployments through a Service name, read the name turning into the Service's address, and read the failure when the backend is gone
- Rebuild a five-part voting application with readiness probes that depend on their backends, a worker that retries, and a database on a claim
- Post a vote from a Pod and from your own machine, and follow it through Redis and the worker into Postgres
- Take Redis away and then Postgres, and read what the Pods and the EndpointSlice say while no vote is lost
- Roll out a new worker image with `set image`, read the history, and look back over Parts I to IV

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | Planning several Deployments › In practice (line 87) |  |
| `hello/server.mjs` | Building the book's own images and loading them › In practice (line 152) |  |
| `webnginx/server.mjs` | Building the book's own images and loading them › In practice (line 172) |  |
| `hello/Dockerfile` | Building the book's own images and loading them › In practice (line 202) |  |
| `nginx-conf.yaml` | Two web apps behind nginx: talking by name › In practice (line 276) |  |
| `apps.yaml` | Two web apps behind nginx: talking by name › In practice (line 291) | the chapter adds to it in later blocks |
| `vote/server.mjs` | The voting app: five parts, one file › In practice (line 667) |  |
| `worker/worker.mjs` | The voting app: five parts, one file › In practice (line 709) |  |
| `result/server.mjs` | The voting app: five parts, one file › In practice (line 763) |  |
| `vote/package.json` | The voting app: five parts, one file › In practice (line 792) |  |
| `worker/package.json` | The voting app: five parts, one file › In practice (line 795) |  |
| `result/package.json` | The voting app: five parts, one file › In practice (line 798) |  |
| `vote/Dockerfile` | The voting app: five parts, one file › In practice (line 802) |  |
| `worker/Dockerfile` | The voting app: five parts, one file › In practice (line 802) |  |
| `result/Dockerfile` | The voting app: five parts, one file › In practice (line 802) |  |
| `voting.yaml` | The voting app: five parts, one file › In practice (line 853) | the chapter adds to it in later blocks |
| `ex2.yaml` | Try it yourself (line 1617) |  |
| `ex3.yaml` | Try it yourself (line 1701) |  |
| `ex4.yaml` | Try it yourself (line 1754) |  |
| `ex5.yaml` | Try it yourself (line 1844) |  |
| `ex6.yaml` | Try it yourself (line 1946) |  |
