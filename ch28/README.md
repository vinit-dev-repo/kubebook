# 28 - The Developer Loop - Skaffold, the Dashboard and Lens

The files the chapter **28 - The Developer Loop - Skaffold, the Dashboard and Lens** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch28`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Name the steps of the inner loop of development, and say what Skaffold does at each step
- Install Skaffold v2.25.0 with a checksum, and read a `skaffold.yaml` of schema version v4beta14
- Use `skaffold init`, `diagnose`, `render`, `build`, `run` and `delete`, and see how Skaffold gets an image into kind with no registry
- Run `skaffold dev`, tell the file-sync path from the rebuild path, and read what Ctrl+C removes
- Sync API code across two build contexts and distinguish an application reload from a container restart
- Say why the Kubernetes Dashboard is archived, install its last manifest, log in with a token, and say why `cluster-admin` is dangerous
- Install Headlamp with Helm, and describe Lens and the other desktop and terminal tools
- Set up `kubectl` completion and the alias `k`, and find a command in the official cheat sheet
- Write a kubectl plugin, find it with `kubectl plugin list`, and set up krew, the plugin manager

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `client.yaml` | The inner loop and Skaffold › In practice (line 168) |  |
| `readpage.sh` | The inner loop and Skaffold › In practice (line 180) |  |
| `app/Dockerfile` | skaffold dev: sync, rebuild and cleanup › In practice (line 482) | written with printf; rewritten later in the chapter |
| `app/html/index.html` | skaffold dev: sync, rebuild and cleanup › In practice (line 463) | written with printf; rewritten later in the chapter |
| `app/html/style.css` | Try it yourself (line 1439) | written with printf; rewritten later in the chapter |
| `app/k8s/web.yaml` | The inner loop and Skaffold › In practice (line 210) |  |
| `app/skaffold.yaml` | The inner loop and Skaffold › In practice (line 293) |  |
| `admin-user.yaml` | The Kubernetes Dashboard › In practice (line 892) |  |
| `plugin-src/kubebook_pods.sh` | kubectl plugins › In practice (line 1196) |  |
| `plugins/kubectl-kubebook_draft` | kubectl plugins › In practice (line 1201) | written with printf |
| `plugins/kubectl-version` | kubectl plugins › In practice (line 1210) | written with printf |
| `plugins/kubectl-kubebook_pods.cmd` | kubectl plugins › In practice (line 1220) |  |
| `plugins/kubectl-version.cmd` | kubectl plugins › In practice (line 1223) |  |
| `app/skaffold-css.yaml` | Try it yourself (line 1400) |  |
| `app/k8s/web-two.yaml` | Try it yourself (line 1573) |  |
| `app/skaffold-profile.yaml` | Try it yourself (line 1605) |  |
| `plugin-src/kubebook_hello.sh` | Try it yourself (line 1631) |  |
| `plugins/kubectl-kubebook-hello.cmd` | Try it yourself (line 1651) |  |
