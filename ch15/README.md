# 15 - A Volume in the Pod and the emptyDir; hostPath, and Modes and Groups of ConfigMap and Secret Volumes; The Downward API, Projected Volumes and ServiceAccount Tokens; subPath, Image Volumes and Local Ephemeral Storage

The files the chapter **15**, in its parts **15.1 - A Volume in the Pod and the emptyDir**, **15.2 - hostPath, and Modes and Groups of ConfigMap and Secret Volumes**, **15.3 - The Downward API, Projected Volumes and ServiceAccount Tokens** and **15.4 - subPath, Image Volumes and Local Ephemeral Storage**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch15`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Declare a volume in `volumes`, mount it in one or more containers, and see a mount hide the folder of the image
- Share an `emptyDir` between containers, keep its files across a container restart, and watch the folder die with the Pod
- Back an `emptyDir` with memory, and read what a `sizeLimit` and a memory limit do to it
- Mount a node's folder with `hostPath`, read its type checks, and see that its data belongs to one node
- Set file modes, `fsGroup` and `optional` on `configMap` and `secret` volumes; prove non-root read denial and group-based repair
- Read Pod fields and container limits as files with a `downwardAPI` volume, and see a label change reach the file
- Combine sources in a `projected` volume, and mount a bounded ServiceAccount token by hand
- Use `subPath`, `subPathExpr` and an `image` volume, and reason about `mountPropagation`
- Meet local ephemeral storage and the generic ephemeral volume, and clean up the chapter
- Run the six exercises of the chapter and delete its cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 15.1 › A volume lives in the Pod › In practice (line 80) |  |
| `two.yaml` | 15.1 › A volume lives in the Pod › In practice (line 124) |  |
| `bmo.yaml` | 15.1 › A volume lives in the Pod › In practice (line 178) |  |
| `shared.yaml` | 15.1 › emptyDir › In practice (line 234) |  |
| `mem.yaml` | 15.1 › emptyDir › In practice (line 361) |  |
| `hog.yaml` | 15.1 › emptyDir › In practice (line 428) |  |
| `mode.yaml` | 15.1 › emptyDir › In practice (line 467) |  |
| `hp.yaml` | 15.2 › hostPath › In practice (line 67) |  |
| `hpfile.yaml` | 15.2 › hostPath › In practice (line 156) |  |
| `root.yaml` | 15.2 › hostPath › In practice (line 196) |  |
| `cmv.yaml` | 15.2 › ConfigMap and Secret volumes, the rest › In practice (line 295) |  |
| `ch15-secret-denied.yaml` | 15.2 › ConfigMap and Secret volumes, the rest › Prove the non-root Secret permission problem, then repair it (line 379) |  |
| `ch15-secret-group.yaml` | 15.2 › ConfigMap and Secret volumes, the rest › Prove the non-root Secret permission problem, then repair it (line 437) |  |
| `dapi.yaml` | 15.3 › The downwardAPI volume › In practice (line 59) |  |
| `proj.yaml` | 15.3 › Projected volumes and the ServiceAccount token › In practice (line 222) |  |
| `claims.sh` | 15.3 › Projected volumes and the ServiceAccount token › In practice (line 300) |  |
| `noauto.yaml` | 15.3 › Projected volumes and the ServiceAccount token › In practice (line 363) |  |
| `podno.yaml` | 15.3 › Projected volumes and the ServiceAccount token › In practice (line 404) |  |
| `satok.yaml` | 15.3 › Projected volumes and the ServiceAccount token › In practice (line 434) |  |
| `sub.yaml` | 15.4 › subPath, subPathExpr and the image volume › In practice (line 82) |  |
| `imgvol.yaml` | 15.4 › subPath, subPathExpr and the image volume › In practice (line 135) |  |
| `eph.yaml` | 15.4 › Local ephemeral storage and the generic ephemeral volume › In practice (line 221) |  |
| `geph.yaml` | 15.4 › Local ephemeral storage and the generic ephemeral volume › In practice (line 254) |  |
| `ex-twin.yaml` | 15.4 › Try it yourself (line 380) |  |
| `ex-keeper.yaml` | 15.4 › Try it yourself (line 420) |  |
| `ex-meta.yaml` | 15.4 › Try it yourself (line 463) |  |
| `ex-proj.yaml` | 15.4 › Try it yourself (line 515) |  |
| `ex-filler.yaml` | 15.4 › Try it yourself (line 562) |  |
| `ex-geph.yaml` | 15.4 › Try it yourself (line 597) |  |
