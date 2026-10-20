# 23 - Helm, Repositories and Installing a Release; RBAC for Helm, Values, Upgrades and Rollbacks; Removed APIs, Uninstalling and the Exercises

The files the chapter **23**, in its parts **23.1 - Helm, Repositories and Installing a Release**, **23.2 - RBAC for Helm, Values, Upgrades and Rollbacks** and **23.3 - Removed APIs, Uninstalling and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch23`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what a chart, a release, a revision and a repository are, and where Helm keeps its records
- Install Helm 4 for real on Windows and on Linux, with a checksum check
- Add a repository, search it by name and by version, and read a chart with `helm show` before you install it
- Install a pinned chart version as a release, and read it back with `helm list`, `helm status` and `helm get`
- Say why `helm list` needs a role that reads Secrets, and what `helm list -A`, `helm status` and an upgrade need
- Change a release with `--set`, `-f` and `--set-string`, and say which values an upgrade keeps or drops
- Look before you change anything, with `helm template` and `--dry-run`
- Upgrade, read the history, roll back, and stop a failed install from leaving a release behind
- Audit the charts and the releases for removed API versions, and repair a release that is stuck on one
- Uninstall with and without `--keep-history`, bring a kept release back, and clean up in order

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `secret-reader.yaml` | 23.2 › What a Helm user needs from RBAC › In practice (line 98) |  |
| `colors.yaml` | 23.2 › Values, and the rules for reusing them › In practice (line 273) |  |
| `a.yaml` | 23.2 › Values, and the rules for reusing them › In practice (line 346) |  |
| `b.yaml` | 23.2 › Values, and the rules for reusing them › In practice (line 351) |  |
| `oldpdb/Chart.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 76) |  |
| `oldpdb/templates/pdb.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 81) |  |
| `notes-crd.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 124) |  |
| `notes/Chart.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 235) | rewritten later in the chapter |
| `notes/values.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 186) |  |
| `notes/templates/note.yaml` | 23.3 › Releases on removed Kubernetes APIs › In practice (line 240) | rewritten later in the chapter |
| `ex/ex-values.yaml` | 23.3 › Try it yourself (line 722) |  |
