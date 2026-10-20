# 10 - Strategies, Recreate and RollingUpdate; Blue-Green, Canary and Choosing a Strategy

The files the chapter **10**, in its parts **10.1 - Strategies, Recreate and RollingUpdate** and **10.2 - Blue-Green, Canary and Choosing a Strategy**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch10`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Name the four questions every deployment strategy answers, and the two strategies that a Deployment knows
- Run a Recreate update and read the outage from the answers a client receives
- Explain why a rolling update with `maxUnavailable: 0` can still drop requests, and measure how a `preStop` sleep reduces shutdown failures
- Build a blue-green release from two Deployments and one Service selector, test green before the switch, and go back with one patch
- Build a canary from one shared label, set its share with Pod counts, and promote it in the right order
- Choose between Recreate, RollingUpdate, blue-green, canary, A/B and traffic shadowing, and know which ones need more than plain Kubernetes

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `app.tmpl` | 10.1 › What a strategy is, and Recreate › In practice (line 97) |  |
| `make.sh` | 10.1 › What a strategy is, and Recreate › In practice (line 132) |  |
| `bump.sh` | 10.1 › What a strategy is, and Recreate › In practice (line 137) |  |
| `svc.yaml` | 10.1 › What a strategy is, and Recreate › In practice (line 154) |  |
| `versions.sh` | 10.1 › What a strategy is, and Recreate › In practice (line 165) |  |
| `watch.sh` | 10.1 › What a strategy is, and Recreate › In practice (line 175) |  |
| `green-test.yaml` | 10.2 › Blue-green: two Deployments and one Service pointer › In practice (line 104) |  |
| `endpoints.sh` | 10.2 › Canary: a small share by Pod count › In practice (line 215) |  |
