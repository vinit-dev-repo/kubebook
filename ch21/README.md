# 21 - A Multi-Container Application on Kubernetes - a Worker, Postgres, Redis, a React Client and Ingress

The files the chapter **21 - A Multi-Container Application on Kubernetes - a Worker, Postgres, Redis, a React Client and Ingress** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch21`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `kind.yaml` | From Compose to Kubernetes: what each part becomes › In practice (line 96) |  |
| `worker/package.json` | The three images and the api's two route prefixes › In practice (line 165) |  |
| `worker/index.js` | The three images and the api's two route prefixes › In practice (line 174) |  |
| `server/package.json` | The three images and the api's two route prefixes › In practice (line 212) |  |
| `server/index.js` | The three images and the api's two route prefixes › In practice (line 223) |  |
| `server/Dockerfile` | The three images and the api's two route prefixes › In practice (line 295) |  |
| `worker/Dockerfile` | The three images and the api's two route prefixes › In practice (line 295) |  |
| `client/index.html` | The three images and the api's two route prefixes › In practice (line 304) |  |
| `client/Dockerfile` | The three images and the api's two route prefixes › In practice (line 328) |  |
| `k8s/api.yaml` | Configuration: Services by name, env and the Secret › In practice (line 459) |  |
| `k8s/client.yaml` | Configuration: Services by name, env and the Secret › In practice (line 515) |  |
| `k8s/postgres.yaml` | Postgres, Redis and the worker › In practice (line 586) |  |
| `k8s/redis.yaml` | Postgres, Redis and the worker › In practice (line 649) |  |
| `k8s/worker.yaml` | Postgres, Redis and the worker › In practice (line 681) |  |
| `k8s/ingress.yaml` | The Ingress in front › In practice (line 940) |  |
