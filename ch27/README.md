# 27 - Kustomize - Bases, Overlays, Transformers, Patches and Components

The files the chapter **27 - Kustomize - Bases, Overlays, Transformers, Patches and Components** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch27`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what a kustomization file is, and why Kustomize edits plain YAML and never fills in a template
- Install Kustomize v5.8.1 with a checksum, and tell the standalone tool from the copy inside `kubectl`
- Build a folder of manifests with `kustomize build`, nest folders, and read the output order
- Change every object at once with transformers, and generate ConfigMaps and Secrets whose names carry a hash
- Change single objects with strategic merge and JSON 6902 patches, and spot the mistakes that build with no error
- Keep one base and many overlays, then preview with `kubectl diff -k` and apply with `kubectl apply -k`
- Switch optional features on with components
- Use replacements, `helmCharts`, `sortOptions`, `buildMetadata`, `openapi` and exec functions, and say when Helm fits better

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `base/deployment.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1852) | rewritten later in the chapter |
| `base/service.yaml` | What Kustomize is, and the kustomization file › In practice (line 185) |  |
| `base/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1881) | rewritten later in the chapter |
| `made/kustomization.yaml` | What Kustomize is, and the kustomization file › In practice (line 356) | written with printf; rewritten later in the chapter |
| `tree/db/configmap.yaml` | Folders and resources › In practice (line 414) |  |
| `tree/db/kustomization.yaml` | Transformers › In practice (line 817) | written with printf; rewritten later in the chapter |
| `tree/web/kustomization.yaml` | Folders and resources › In practice (line 423) | written with printf |
| `tree/kustomization.yaml` | Transformers › In practice (line 818) | written with printf; rewritten later in the chapter |
| `multi/app.yaml` | Folders and resources › In practice (line 482) |  |
| `multi/kustomization.yaml` | Folders and resources › In practice (line 499) | written with printf |
| `shared/replicas.yaml` | Folders and resources › In practice (line 515) |  |
| `lr/kustomization.yaml` | Folders and resources › In practice (line 523) |  |
| `common/kustomization.yaml` | Transformers › In practice (line 648) | written with printf; rewritten later in the chapter |
| `img/kustomization.yaml` | Transformers › In practice (line 748) | rewritten later in the chapter |
| `old/p.yaml` | Transformers › In practice (line 838) |  |
| `old/kustomization.yaml` | Transformers › In practice (line 846) |  |
| `gen/app.env` | Generators for ConfigMaps and Secrets › In practice (line 1008) | written with printf; rewritten later in the chapter |
| `gen/motd.txt` | Generators for ConfigMaps and Secrets › In practice (line 908) | written with printf |
| `gen/deployment.yaml` | Generators for ConfigMaps and Secrets › In practice (line 910) |  |
| `gen/kustomization.yaml` | Generators for ConfigMaps and Secrets › In practice (line 937) | the chapter adds to it in later blocks |
| `gen-prod/kustomization.yaml` | Generators for ConfigMaps and Secrets › In practice (line 1025) |  |
| `gen-shop/kustomization.yaml` | Generators for ConfigMaps and Secrets › In practice (line 1052) | written with printf |
| `sec/username.txt` | Generators for ConfigMaps and Secrets › In practice (line 1079) | written with printf |
| `sec/password.txt` | Generators for ConfigMaps and Secrets › In practice (line 1080) | written with printf |
| `sec/kustomization.yaml` | Generators for ConfigMaps and Secrets › In practice (line 1092) | rewritten later in the chapter |
| `pat/replicas.yaml` | Patches › In practice (line 1175) |  |
| `pat/kustomization.yaml` | Patches › In practice (line 1629) | rewritten later in the chapter |
| `two.yaml` | Patches › In practice (line 1545) | written with printf |
| `pat/nomatch.yaml` | Patches › In practice (line 1574) |  |
| `overlays/dev/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1676) |  |
| `overlays/prod/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1687) | the chapter adds to it in later blocks |
| `overlays/prod/limits.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1706) |  |
| `overlays/prod-eu/notes.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1754) |  |
| `overlays/prod-eu/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1762) |  |
| `compose/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1788) | written with printf |
| `loc/kustomization.yaml` | Bases and overlays, and applying to a cluster › In practice (line 1813) | written with printf |
| `components/cache/redis.yaml` | Components › In practice (line 2122) |  |
| `components/cache/kustomization.yaml` | Components › In practice (line 2133) |  |
| `components/metrics/kustomization.yaml` | Components › In practice (line 2153) |  |
| `overlays/cached/kustomization.yaml` | Components › In practice (line 2167) |  |
| `overlays/full/kustomization.yaml` | Components › In practice (line 2175) |  |
| `overlays/wrong/kustomization.yaml` | Components › In practice (line 2216) |  |
| `tf/kustomization.yaml` | Beyond the basics › In practice (line 2267) |  |
| `sorted/kustomization.yaml` | Beyond the basics › In practice (line 2302) |  |
| `rep/kustomization.yaml` | Beyond the basics › In practice (line 2330) | the chapter adds to it in later blocks |
| `vv/kustomization.yaml` | Beyond the basics › In practice (line 2394) |  |
| `hc/kustomization.yaml` | Beyond the basics › In practice (line 2424) |  |
| `bm/kustomization.yaml` | Beyond the basics › In practice (line 2489) |  |
| `cr/app.yaml` | Beyond the basics › In practice (line 2511) |  |
| `cr/kustomization.yaml` | Beyond the basics › In practice (line 2592) | rewritten later in the chapter |
| `cr/crd.yaml` | Beyond the basics › In practice (line 2551) |  |
| `cr/names.yaml` | Beyond the basics › In practice (line 2584) |  |
| `oa/widget.yaml` | Beyond the basics › In practice (line 2618) |  |
| `oa/patch.yaml` | Beyond the basics › In practice (line 2630) |  |
| `oa/schema.json` | Beyond the basics › In practice (line 2640) |  |
| `oa/kustomization.yaml` | Beyond the basics › In practice (line 2667) | written with printf; rewritten later in the chapter |
| `krm/plugins/gen.sh` | Beyond the basics › In practice (line 2718) |  |
| `krm/gen.yaml` | Beyond the basics › In practice (line 2733) |  |
| `krm/kustomization.yaml` | Beyond the basics › In practice (line 2742) | written with printf |
| `overlays/staging/kustomization.yaml` | Try it yourself (line 2825) |  |
| `ex3/deployment.yaml` | Try it yourself (line 2885) |  |
| `ex3/kustomization.yaml` | Try it yourself (line 2907) |  |
| `ex4/kustomization.yaml` | Try it yourself (line 2933) |  |
| `components/debug/kustomization.yaml` | Try it yourself (line 2979) |  |
| `overlays/debugging/kustomization.yaml` | Try it yourself (line 2998) | written with printf |
| `overlays/quiet/kustomization.yaml` | Try it yourself (line 2999) | written with printf |
| `ex6/kustomization.yaml` | Try it yourself (line 3021) |  |
