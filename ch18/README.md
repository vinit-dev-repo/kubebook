# 18 - Ingress and the Gateway API - Routes, TLS and Rewrites

The files the chapter **18 - Ingress and the Gateway API - Routes, TLS and Rewrites** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch18`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what an Ingress is, why it needs a controller, and which controller this book uses now that ingress-nginx is archived
- Write Ingress rules for hosts and paths, choose `Prefix` or `Exact`, and read the 404 and 500 answers
- Serve HTTPS from an Ingress with a TLS Secret, and see why the proxy does not redirect to HTTPS by itself
- Read the Gateway API objects GatewayClass, Gateway and HTTPRoute, and their status conditions
- Match on header and query, add headers, redirect and split traffic with route filters and weights, and test which matches and filters a controller applies
- Share one Gateway between namespaces with `allowedRoutes` and a ReferenceGrant, and bind a route to a wildcard listener
- Delete Ingress and Gateway objects in the right order, so that no proxy container stays behind

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | An Ingress and the controller behind it › In practice (line 80) |  |
| `app.yaml` | An Ingress and the controller behind it › In practice (line 113) |  |
| `ask.sh` | An Ingress and the controller behind it › In practice (line 166) |  |
| `asks.sh` | An Ingress and the controller behind it › In practice (line 169) |  |
| `code.sh` | An Ingress and the controller behind it › In practice (line 172) |  |
| `cond.sh` | An Ingress and the controller behind it › In practice (line 175) |  |
| `ing2.yaml` | Rules: hosts, paths and path types › In practice (line 466) |  |
| `bad.yaml` | Rules: hosts, paths and path types › In practice (line 580) |  |
| `notype.yaml` | Rules: hosts, paths and path types › In practice (line 610) |  |
| `default.yaml` | Rules: hosts, paths and path types › In practice (line 660) |  |
| `gw.yaml` | The Gateway API: GatewayClass, Gateway and HTTPRoute › In practice (line 786) |  |
| `route.yaml` | Matches and filters: rewrites, headers, redirects and weights › In practice (line 939) | rewritten later in the chapter |
| `redirect.yaml` | Matches and filters: rewrites, headers, redirects and weights › In practice (line 1079) |  |
| `badroute.yaml` | Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 1160) |  |
| `otherroute.yaml` | Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 1195) |  |
| `grant.yaml` | Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 1247) |  |
| `wildroute.yaml` | Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 1281) |  |
| `misfit.yaml` | Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 1323) |  |
| `ex-gw.yaml` | Try it yourself (line 1521) |  |
| `ex-header.yaml` | Try it yourself (line 1537) |  |
| `ex-redirect.yaml` | Try it yourself (line 1581) |  |
| `ex-other.yaml` | Try it yourself (line 1618) |  |
| `ex-grant.yaml` | Try it yourself (line 1642) |  |
