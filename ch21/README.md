# 21 - A Multi-Container Application on Kubernetes - a Worker, Postgres, Redis, a React Client and Ingress

Files this chapter writes in its blocks, extracted byte for byte from the certified chapter. The chapter itself explains every line; read it in the tutorial. The blocks `cat` these files into a work folder `~/kubebook-ch21`; cloning this folder there gives the same result.

- `kind.yaml`
- `worker/package.json`
- `worker/index.js`
- `server/package.json`
- `server/index.js`
- `client/index.html`
- `client/Dockerfile`
- `server/Dockerfile`, `worker/Dockerfile` (the chapter writes them in one loop)
- `k8s/api.yaml`
- `k8s/client.yaml`
- `k8s/postgres.yaml`
- `k8s/redis.yaml`
- `k8s/worker.yaml`
- `k8s/ingress.yaml`
