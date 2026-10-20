# 18 - An Ingress, Its Rules and TLS; The Gateway API, Matches and Filters; Namespaces, ReferenceGrant, Cleanup and the Exercises

The files the chapter **18**, in its parts **18.1 - An Ingress, Its Rules and TLS**, **18.2 - The Gateway API, Matches and Filters** and **18.3 - Namespaces, ReferenceGrant, Cleanup and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch18`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what an Ingress is, why it needs a controller, and which controller this book uses now that ingress-nginx is archived
- Write Ingress rules for hosts and paths, choose `Prefix` or `Exact`, and read the 404 and 500 answers
- Serve HTTPS from an Ingress with a TLS Secret, and see why the proxy does not redirect to HTTPS by itself
- Read the Gateway API objects GatewayClass, Gateway and HTTPRoute, and their status conditions
- Match on header and query, add headers, redirect and split traffic with route filters and weights, and test which matches and filters a controller applies
- Share one Gateway between namespaces with `allowedRoutes` and a ReferenceGrant, and bind a route to a wildcard listener
- Delete Ingress and Gateway objects in the right order, so that no proxy container stays behind
- Run the six exercises of the chapter, then compare the first controller with Envoy Gateway on method, rewrite, redirect, mirror, cookie affinity, TLS passthrough and TCP routing

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 18.1 › An Ingress and the controller behind it › In practice (line 83) |  |
| `app.yaml` | 18.1 › An Ingress and the controller behind it › In practice (line 118) |  |
| `ask.sh` | 18.1 › An Ingress and the controller behind it › In practice (line 171) |  |
| `asks.sh` | 18.1 › An Ingress and the controller behind it › In practice (line 174) |  |
| `code.sh` | 18.1 › An Ingress and the controller behind it › In practice (line 177) |  |
| `cond.sh` | 18.1 › An Ingress and the controller behind it › In practice (line 180) |  |
| `ing2.yaml` | 18.1 › Rules: hosts, paths and path types › In practice (line 486) |  |
| `bad.yaml` | 18.1 › Rules: hosts, paths and path types › In practice (line 600) |  |
| `notype.yaml` | 18.1 › Rules: hosts, paths and path types › In practice (line 630) |  |
| `default.yaml` | 18.1 › Rules: hosts, paths and path types › In practice (line 681) |  |
| `gw.yaml` | 18.2 › The Gateway API: GatewayClass, Gateway and HTTPRoute › In practice (line 70) |  |
| `route.yaml` | 18.2 › Matches and filters: rewrites, headers, redirects and weights › In practice (line 237) | rewritten later in the chapter |
| `redirect.yaml` | 18.2 › Matches and filters: rewrites, headers, redirects and weights › In practice (line 387) |  |
| `badroute.yaml` | 18.3 › Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 85) |  |
| `otherroute.yaml` | 18.3 › Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 119) |  |
| `grant.yaml` | 18.3 › Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 171) |  |
| `wildroute.yaml` | 18.3 › Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 206) |  |
| `misfit.yaml` | 18.3 › Namespaces, ReferenceGrant and listeners with hostnames › In practice (line 247) |  |
| `ex-gw.yaml` | 18.3 › Try it yourself (line 459) |  |
| `ex-header.yaml` | 18.3 › Try it yourself (line 475) |  |
| `ex-redirect.yaml` | 18.3 › Try it yourself (line 519) |  |
| `ex-other.yaml` | 18.3 › Try it yourself (line 556) |  |
| `ex-grant.yaml` | 18.3 › Try it yourself (line 580) |  |
