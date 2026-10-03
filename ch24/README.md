# 24 - Writing Helm Charts - Structure, Built-in Objects, Functions, Flow Control, Variables and Named Templates

The chart that this chapter ends with, as its files stand after the last block of the packaging section. The chapter writes many small teaching templates on the way (built-in objects, functions, flow control, variables, named templates, and deliberately broken ones for the error messages) and removes each of them again; they are explained in the tutorial and are not kept here. `helm create kubebook-ch24-web` also writes `.helmignore`, and the chapter adds `config/app.txt` and a `secret.txt` line to it; make those with the chapter's blocks.

- `kubebook-ch24-web/Chart.yaml`
- `kubebook-ch24-web/values.yaml` (with the `serviceType: ClusterIP` line that the packaging block appends)
- `kubebook-ch24-web/templates/_helpers.tpl`
- `kubebook-ch24-web/templates/deployment.yaml`
- `kubebook-ch24-web/templates/service.yaml`
- `kubebook-ch24-web/templates/NOTES.txt`

The section "CRDs in the crds folder, and helm show crds" builds a second chart, also complete here:
- `kubebook-ch24-crd/Chart.yaml`
- `kubebook-ch24-crd/crds/backups.yaml` (the final file, with the `retention` field the upgrade adds)
- `kubebook-ch24-crd/templates/backup.yaml`
The section on chart conventions makes `kubebook-ch24-conv` with `helm create`, then adds a Role and a RoleBinding; run those blocks to build it.
