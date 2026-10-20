# 27 - Kustomization Files, Folders, Transformers and Generators; Patches, Overlays, Applying to a Cluster and Components; Beyond the Basics and the Exercises

The files the chapter **27**, in its parts **27.1 - Kustomization Files, Folders, Transformers and Generators**, **27.2 - Patches, Overlays, Applying to a Cluster and Components** and **27.3 - Beyond the Basics and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch27`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what a kustomization file is, and why Kustomize edits plain YAML and never fills in a template
- Install Kustomize v5.8.1 with a checksum, build a folder of manifests and nest folders
- Change every object at once with transformers, and generate ConfigMaps and Secrets whose names carry a hash
- Read the order of the output, and the errors for a misspelled field, a missing file and a file outside the folder
- Change single objects with strategic merge patches and JSON 6902 patches, and choose them with a target
- Spot the patch mistakes that build with no error
- Keep one base and many overlays, then preview with `kubectl diff -k` and apply with `kubectl apply -k`
- Switch optional features on with components
- Copy a value from one object into others with `replacements`
- Inflate a Helm chart inside a build with `helmCharts`, and say when Helm itself fits better
- Teach Kustomize the fields of a custom resource with `configurations` and `openapi`
- Run an exec function, and say why it needs two switches and your trust

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `base/deployment.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 770) | rewritten later in the chapter |
| `base/service.yaml` | 27.1 › What Kustomize is, and the kustomization file › In practice (line 183) |  |
| `base/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 799) | rewritten later in the chapter |
| `made/kustomization.yaml` | 27.1 › What Kustomize is, and the kustomization file › In practice (line 349) | written with printf; rewritten later in the chapter |
| `tree/db/configmap.yaml` | 27.1 › Folders and resources › In practice (line 416) |  |
| `tree/db/kustomization.yaml` | 27.1 › Transformers › In practice (line 820) | written with printf; rewritten later in the chapter |
| `tree/web/kustomization.yaml` | 27.1 › Folders and resources › In practice (line 425) | written with printf |
| `tree/kustomization.yaml` | 27.1 › Transformers › In practice (line 821) | written with printf; rewritten later in the chapter |
| `multi/app.yaml` | 27.1 › Folders and resources › In practice (line 482) |  |
| `multi/kustomization.yaml` | 27.1 › Folders and resources › In practice (line 499) | written with printf |
| `shared/replicas.yaml` | 27.1 › Folders and resources › In practice (line 514) |  |
| `lr/kustomization.yaml` | 27.1 › Folders and resources › In practice (line 522) |  |
| `common/kustomization.yaml` | 27.1 › Transformers › In practice (line 652) | written with printf; rewritten later in the chapter |
| `img/kustomization.yaml` | 27.1 › Transformers › In practice (line 751) | rewritten later in the chapter |
| `old/p.yaml` | 27.1 › Transformers › In practice (line 842) |  |
| `old/kustomization.yaml` | 27.1 › Transformers › In practice (line 850) |  |
| `gen/app.env` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1019) | written with printf; rewritten later in the chapter |
| `gen/motd.txt` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 922) | written with printf |
| `gen/deployment.yaml` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 924) |  |
| `gen/kustomization.yaml` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 951) | the chapter adds to it in later blocks |
| `gen-prod/kustomization.yaml` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1035) |  |
| `gen-shop/kustomization.yaml` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1061) | written with printf |
| `sec/username.txt` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1086) | written with printf |
| `sec/password.txt` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1087) | written with printf |
| `sec/kustomization.yaml` | 27.1 › Generators for ConfigMaps and Secrets › In practice (line 1099) | rewritten later in the chapter |
| `pat/replicas.yaml` | 27.2 › Patches › In practice (line 80) |  |
| `pat/kustomization.yaml` | 27.2 › Patches › In practice (line 535) | rewritten later in the chapter |
| `two.yaml` | 27.2 › Patches › In practice (line 447) | written with printf |
| `pat/nomatch.yaml` | 27.2 › Patches › In practice (line 480) |  |
| `overlays/dev/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 592) |  |
| `overlays/prod/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 603) | the chapter adds to it in later blocks |
| `overlays/prod/limits.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 622) |  |
| `overlays/prod-eu/notes.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 671) |  |
| `overlays/prod-eu/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 679) |  |
| `compose/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 704) | written with printf |
| `loc/kustomization.yaml` | 27.2 › Bases and overlays, and applying to a cluster › In practice (line 732) | written with printf |
| `components/cache/redis.yaml` | 27.2 › Components › In practice (line 1041) |  |
| `components/cache/kustomization.yaml` | 27.2 › Components › In practice (line 1052) |  |
| `components/metrics/kustomization.yaml` | 27.2 › Components › In practice (line 1072) |  |
| `overlays/cached/kustomization.yaml` | 27.2 › Components › In practice (line 1085) |  |
| `overlays/full/kustomization.yaml` | 27.2 › Components › In practice (line 1093) |  |
| `overlays/wrong/kustomization.yaml` | 27.2 › Components › In practice (line 1134) |  |
| `tf/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 68) |  |
| `sorted/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 102) |  |
| `rep/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 129) | the chapter adds to it in later blocks |
| `vv/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 191) |  |
| `hc/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 223) |  |
| `bm/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 286) |  |
| `cr/app.yaml` | 27.3 › Beyond the basics › In practice (line 307) |  |
| `cr/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 390) | rewritten later in the chapter |
| `cr/crd.yaml` | 27.3 › Beyond the basics › In practice (line 349) |  |
| `cr/names.yaml` | 27.3 › Beyond the basics › In practice (line 382) |  |
| `oa/widget.yaml` | 27.3 › Beyond the basics › In practice (line 417) |  |
| `oa/patch.yaml` | 27.3 › Beyond the basics › In practice (line 429) |  |
| `oa/schema.json` | 27.3 › Beyond the basics › In practice (line 439) |  |
| `oa/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 466) | written with printf; rewritten later in the chapter |
| `krm/plugins/gen.sh` | 27.3 › Beyond the basics › In practice (line 519) |  |
| `krm/gen.yaml` | 27.3 › Beyond the basics › In practice (line 534) |  |
| `krm/kustomization.yaml` | 27.3 › Beyond the basics › In practice (line 543) | written with printf |
| `overlays/staging/kustomization.yaml` | 27.3 › Try it yourself (line 630) |  |
| `ex3/deployment.yaml` | 27.3 › Try it yourself (line 690) |  |
| `ex3/kustomization.yaml` | 27.3 › Try it yourself (line 712) |  |
| `ex4/kustomization.yaml` | 27.3 › Try it yourself (line 738) |  |
| `components/debug/kustomization.yaml` | 27.3 › Try it yourself (line 784) |  |
| `overlays/debugging/kustomization.yaml` | 27.3 › Try it yourself (line 803) | written with printf |
| `overlays/quiet/kustomization.yaml` | 27.3 › Try it yourself (line 804) | written with printf |
| `ex6/kustomization.yaml` | 27.3 › Try it yourself (line 826) |  |
