# 23 - Helm - Repositories, Releases, Values, Upgrades and Rollbacks

The files the chapter **23 - Helm - Repositories, Releases, Values, Upgrades and Rollbacks** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch23`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what a chart, a release, a revision and a repository are, and where Helm keeps its records
- Install Helm 4 for real on Windows and on Linux, with a checksum check
- Add a repository, search it by name and by version, and read a chart with `helm show` before you install it
- Install a pinned chart version as a release, and read it back with `helm list`, `helm status` and `helm get`
- Change a release with `--set`, `-f` and `--set-string`, and say which values an upgrade keeps or drops
- Look before you change anything, with `helm template` and `--dry-run`
- Upgrade, read the history, roll back, and stop a failed install from leaving a release behind
- Uninstall with and without `--keep-history`, and clean up

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `secret-reader.yaml` | What a Helm user needs from RBAC › In practice (line 605) |  |
| `colors.yaml` | Values, and the rules for reusing them › In practice (line 768) |  |
| `a.yaml` | Values, and the rules for reusing them › In practice (line 843) |  |
| `b.yaml` | Values, and the rules for reusing them › In practice (line 848) |  |
| `oldpdb/Chart.yaml` | Releases on removed Kubernetes APIs › In practice (line 1331) |  |
| `oldpdb/templates/pdb.yaml` | Releases on removed Kubernetes APIs › In practice (line 1336) |  |
| `notes-crd.yaml` | Releases on removed Kubernetes APIs › In practice (line 1378) |  |
| `notes/Chart.yaml` | Releases on removed Kubernetes APIs › In practice (line 1491) | rewritten later in the chapter |
| `notes/values.yaml` | Releases on removed Kubernetes APIs › In practice (line 1441) |  |
| `notes/templates/note.yaml` | Releases on removed Kubernetes APIs › In practice (line 1496) | rewritten later in the chapter |
| `ex/ex-values.yaml` | Try it yourself (line 1976) |  |
