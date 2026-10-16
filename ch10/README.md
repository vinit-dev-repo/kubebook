# 10 - Deployment Strategies - Recreate, Blue-Green and Canary

The files the chapter **10 - Deployment Strategies - Recreate, Blue-Green and Canary** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch10`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `app.tmpl` | What a strategy is, and Recreate › In practice (line 94) |  |
| `make.sh` | What a strategy is, and Recreate › In practice (line 129) |  |
| `bump.sh` | What a strategy is, and Recreate › In practice (line 134) |  |
| `svc.yaml` | What a strategy is, and Recreate › In practice (line 147) |  |
| `versions.sh` | What a strategy is, and Recreate › In practice (line 158) |  |
| `watch.sh` | What a strategy is, and Recreate › In practice (line 168) |  |
| `green-test.yaml` | Blue-green: two Deployments and one Service pointer › In practice (line 404) |  |
| `endpoints.sh` | Canary: a small share by Pod count › In practice (line 508) |  |
