# 15 - Volumes - emptyDir, hostPath, ConfigMap, Secret, Projected and Downward API Volumes

The files the chapter **15 - Volumes - emptyDir, hostPath, ConfigMap, Secret, Projected and Downward API Volumes** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch15`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Declare a volume in `volumes`, mount it in one or more containers, and see a mount hide the folder of the image
- Share an `emptyDir` between containers, keep its files across a container restart, and watch the folder die with the Pod
- Back an `emptyDir` with memory, and read what a `sizeLimit` and a memory limit do to it
- Mount a node's folder with `hostPath`, read its type checks, and see that its data belongs to one node
- Set file modes, `fsGroup` and `optional` on `configMap` and `secret` volumes; prove non-root read denial and group-based repair
- Read Pod fields and container limits as files with a `downwardAPI` volume, and see a label change reach the file
- Combine sources in a `projected` volume, and mount a bounded ServiceAccount token by hand
- Use `subPath`, `subPathExpr` and an `image` volume, then meet local ephemeral storage and the generic ephemeral volume

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | A volume lives in the Pod › In practice (line 78) |  |
| `two.yaml` | A volume lives in the Pod › In practice (line 123) |  |
| `bmo.yaml` | A volume lives in the Pod › In practice (line 177) |  |
| `shared.yaml` | emptyDir › In practice (line 223) |  |
| `mem.yaml` | emptyDir › In practice (line 343) |  |
| `hog.yaml` | emptyDir › In practice (line 406) |  |
| `mode.yaml` | emptyDir › In practice (line 445) |  |
| `hp.yaml` | hostPath › In practice (line 493) |  |
| `hpfile.yaml` | hostPath › In practice (line 582) |  |
| `root.yaml` | hostPath › In practice (line 621) |  |
| `cmv.yaml` | ConfigMap and Secret volumes, the rest › In practice (line 712) |  |
| `ch15-secret-denied.yaml` | ConfigMap and Secret volumes, the rest › Prove the non-root Secret permission problem, then repair it (line 797) |  |
| `ch15-secret-group.yaml` | ConfigMap and Secret volumes, the rest › Prove the non-root Secret permission problem, then repair it (line 857) |  |
| `dapi.yaml` | The downwardAPI volume › In practice (line 987) |  |
| `proj.yaml` | Projected volumes and the ServiceAccount token › In practice (line 1132) |  |
| `claims.sh` | Projected volumes and the ServiceAccount token › In practice (line 1210) |  |
| `noauto.yaml` | Projected volumes and the ServiceAccount token › In practice (line 1270) |  |
| `podno.yaml` | Projected volumes and the ServiceAccount token › In practice (line 1312) |  |
| `satok.yaml` | Projected volumes and the ServiceAccount token › In practice (line 1339) |  |
| `sub.yaml` | subPath, subPathExpr and the image volume › In practice (line 1431) |  |
| `imgvol.yaml` | subPath, subPathExpr and the image volume › In practice (line 1483) |  |
| `eph.yaml` | Local ephemeral storage and the generic ephemeral volume › In practice (line 1555) |  |
| `geph.yaml` | Local ephemeral storage and the generic ephemeral volume › In practice (line 1589) |  |
| `ex-twin.yaml` | Try it yourself (line 1717) |  |
| `ex-keeper.yaml` | Try it yourself (line 1757) |  |
| `ex-meta.yaml` | Try it yourself (line 1800) |  |
| `ex-proj.yaml` | Try it yourself (line 1852) |  |
| `ex-filler.yaml` | Try it yourself (line 1899) |  |
| `ex-geph.yaml` | Try it yourself (line 1934) |  |
