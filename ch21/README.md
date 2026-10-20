# 21 - From Compose to Kubernetes and the Three Images; Services by Name, the Secret, Postgres, Redis and the Worker; The Ingress, Operating the Application and the Exercises

The files the chapter **21**, in its parts **21.1 - From Compose to Kubernetes and the Three Images**, **21.2 - Services by Name, the Secret, Postgres, Redis and the Worker** and **21.3 - The Ingress, Operating the Application and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch21`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say where each part of a Compose project goes on Kubernetes: a Deployment, a ClusterIP Service, an Ingress, a claim or a Secret
- Build the api, worker and client images with pinned package versions, and load them into kind
- Change the api so that it answers under `/api`, because nothing in front of it rewrites a path
- Give Postgres its password from a Secret, and read the error that a Pod shows when it has none
- Keep one file for each part in one folder, and apply the whole folder with one command
- Run Postgres on a claim, Redis with no volume and the worker with no Service
- Put an Ingress in front, and send requests from a Pod and from your own machine
- Delete the Postgres and Redis Pods, run two workers, and clean up in the right order

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 21.1 › From Compose to Kubernetes: what each part becomes › In practice (line 93) |  |
| `worker/package.json` | 21.1 › The three images and the api's two route prefixes › In practice (line 177) |  |
| `worker/index.js` | 21.1 › The three images and the api's two route prefixes › In practice (line 186) |  |
| `server/package.json` | 21.1 › The three images and the api's two route prefixes › In practice (line 226) |  |
| `server/index.js` | 21.1 › The three images and the api's two route prefixes › In practice (line 237) |  |
| `server/Dockerfile` | 21.1 › The three images and the api's two route prefixes › In practice (line 308) |  |
| `worker/Dockerfile` | 21.1 › The three images and the api's two route prefixes › In practice (line 308) |  |
| `client/index.html` | 21.1 › The three images and the api's two route prefixes › In practice (line 317) |  |
| `client/Dockerfile` | 21.1 › The three images and the api's two route prefixes › In practice (line 341) |  |
| `k8s/api.yaml` | 21.2 › Configuration: Services by name, env and the Secret › In practice (line 103) |  |
| `k8s/client.yaml` | 21.2 › Configuration: Services by name, env and the Secret › In practice (line 158) |  |
| `k8s/postgres.yaml` | 21.2 › Postgres, Redis and the worker › In practice (line 236) |  |
| `k8s/redis.yaml` | 21.2 › Postgres, Redis and the worker › In practice (line 298) |  |
| `k8s/worker.yaml` | 21.2 › Postgres, Redis and the worker › In practice (line 330) |  |
| `k8s/ingress.yaml` | 21.3 › The Ingress in front › In practice (line 144) |  |
