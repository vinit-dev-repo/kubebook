# 28 - The Inner Loop, Skaffold and skaffold dev; The Dashboard, Headlamp and Lens; kubectl Completion, Plugins and the Exercises

The files the chapter **28**, in its parts **28.1 - The Inner Loop, Skaffold and skaffold dev**, **28.2 - The Dashboard, Headlamp and Lens** and **28.3 - kubectl Completion, Plugins and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch28`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Name the steps of the inner loop of development, and say what Skaffold does at each step
- Install Skaffold v2.25.0 with a checksum, and read a `skaffold.yaml` of schema version v4beta14
- Use `skaffold init`, `diagnose`, `render`, `build`, `run` and `delete`, and see how Skaffold gets an image into kind with no registry
- Run `skaffold dev`, tell the file-sync path from the rebuild path, and read what Ctrl+C removes
- Sync API code across two build contexts and distinguish an application reload from a container restart
- Say why the Kubernetes Dashboard is archived, install its last manifest, and log in with a token
- Say why a `cluster-admin` token is dangerous, and reach a Service by `kubectl port-forward` and by `kubectl proxy`
- Install Headlamp with Helm, and describe Lens and the other desktop and terminal tools
- Set up `kubectl` completion and the alias `k`, and find a command in the official cheat sheet
- Write a kubectl plugin, find it with `kubectl plugin list`, and set up krew, the plugin manager
- Clean up the cluster and the images that Skaffold built

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `client.yaml` | 28.1 › The inner loop and Skaffold › In practice (line 165) |  |
| `readpage.sh` | 28.1 › The inner loop and Skaffold › In practice (line 177) |  |
| `app/Dockerfile` | 28.1 › skaffold dev: sync, rebuild and cleanup › In practice (line 480) | written with printf; rewritten later in the chapter |
| `app/html/index.html` | 28.1 › skaffold dev: sync, rebuild and cleanup › In practice (line 460) | written with printf; rewritten later in the chapter |
| `app/html/style.css` | 28.3 › Try it yourself (line 390) | written with printf; rewritten later in the chapter |
| `app/k8s/web.yaml` | 28.1 › The inner loop and Skaffold › In practice (line 206) |  |
| `app/skaffold.yaml` | 28.1 › The inner loop and Skaffold › In practice (line 289) |  |
| `admin-user.yaml` | 28.2 › The Kubernetes Dashboard › In practice (line 148) |  |
| `plugin-src/kubebook_pods.sh` | 28.3 › kubectl plugins › In practice (line 148) |  |
| `plugins/kubectl-kubebook_draft` | 28.3 › kubectl plugins › In practice (line 153) | written with printf |
| `plugins/kubectl-version` | 28.3 › kubectl plugins › In practice (line 162) | written with printf |
| `plugins/kubectl-kubebook_pods.cmd` | 28.3 › kubectl plugins › In practice (line 172) |  |
| `plugins/kubectl-version.cmd` | 28.3 › kubectl plugins › In practice (line 175) |  |
| `app/skaffold-css.yaml` | 28.3 › Try it yourself (line 351) |  |
| `app/k8s/web-two.yaml` | 28.3 › Try it yourself (line 524) |  |
| `app/skaffold-profile.yaml` | 28.3 › Try it yourself (line 556) |  |
| `plugin-src/kubebook_hello.sh` | 28.3 › Try it yourself (line 582) |  |
| `plugins/kubectl-kubebook-hello.cmd` | 28.3 › Try it yourself (line 602) |  |
