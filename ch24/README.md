# 24 - Chart Files, Built-in Objects, Actions and Pipelines; Value Types, Flow Control, Variables and Named Templates; Pod Conventions, Packaging and CRDs

The files the chapter **24**, in its parts **24.1 - Chart Files, Built-in Objects, Actions and Pipelines**, **24.2 - Value Types, Flow Control, Variables and Named Templates** and **24.3 - Pod Conventions, Packaging and CRDs**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch24`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Read the folder of a chart and say what `Chart.yaml`, `values.yaml`, `templates/`, `_helpers.tpl`, `NOTES.txt`, `charts/` and `.helmignore` are for
- Make a chart with `helm create`, check it with `helm lint`, and look at its objects with `helm template` and `--show-only`
- Read the built-in objects `.Release`, `.Chart`, `.Values`, `.Capabilities`, `.Template` and `.Files`, and say what the dot means
- Write actions and pipelines with `quote`, `default`, `printf`, `indent`, `nindent` and `toYaml`, and control whitespace with a dash
- Name the type of a value with `typeOf`, `kindOf` and `printf`, and convert a number with `int` before `eq` or `%d`
- Write `if`, `else`, `with` and `range` blocks, and reach the root object from inside them with `$`
- Keep a value in a variable, write a named template with `define`, and choose `include` over `template`
- Stop a bad render early with `required` and `fail`, and read the errors that Helm prints
- Read the conventions for an image, a selector and a ServiceAccount, and the switches `serviceAccount.create` and `rbac.create`
- Package a chart, install it from the package, and upgrade the release to a newer package
- Say when to change `version` and when to change `appVersion`
- Put a CRD in `crds/`, read it with `helm show crds`, and say what Helm does and does not do with it

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kubebook-ch24-web/values.yaml` | 24.1 › Built-in objects and the dot › In practice (line 350) | the chapter adds to it in later blocks |
| `kubebook-ch24-web/config/app.txt` | 24.1 › Built-in objects and the dot › In practice (line 365) | written with printf |
| `kubebook-ch24-web/templates/objects.yaml` | 24.1 › Built-in objects and the dot › In practice (line 374) |  |
| `kubebook-ch24-web/templates/files.yaml` | 24.1 › Built-in objects and the dot › In practice (line 437) |  |
| `kubebook-ch24-web/templates/fns.yaml` | 24.1 › Actions, pipelines, functions and whitespace › In practice (line 498) |  |
| `kubebook-ch24-web/templates/bad.yaml` | 24.2 › Variables and named templates › In practice (line 570) | rewritten later in the chapter |
| `kubebook-ch24-web/templates/ws.yaml` | 24.1 › Actions, pipelines, functions and whitespace › In practice (line 602) |  |
| `kubebook-ch24-yaml-guard/source/Chart.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 702) |  |
| `kubebook-ch24-yaml-guard/source/values.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 707) |  |
| `kubebook-ch24-yaml-guard/source/templates/unsafe.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 712) |  |
| `kubebook-ch24-yaml-guard/source/templates/quoted.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 720) |  |
| `kubebook-ch24-yaml-guard/source/templates/block.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 728) |  |
| `kubebook-ch24-yaml-guard/source/templates/typed.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 737) |  |
| `kubebook-ch24-yaml-guard/check/Chart.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 745) |  |
| `kubebook-ch24-yaml-guard/check/templates/check.yaml` | 24.1 › Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 750) |  |
| `kubebook-ch24-tpl/Chart.yaml` | 24.1 › Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 832) |  |
| `kubebook-ch24-tpl/values.yaml` | 24.1 › Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 837) |  |
| `kubebook-ch24-tpl/templates/config.yaml` | 24.1 › Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 840) |  |
| `kubebook-ch24-web/templates/types.yaml` | 24.2 › Value types, and finding them with typeOf, kindOf and printf › In practice (line 60) |  |
| `three.yaml` | 24.2 › Value types, and finding them with typeOf, kindOf and printf › In practice (line 87) | written with echo |
| `kubebook-ch24-web/templates/convert.yaml` | 24.2 › Value types, and finding them with typeOf, kindOf and printf › In practice (line 131) |  |
| `big.yaml` | 24.2 › Value types, and finding them with typeOf, kindOf and printf › In practice (line 134) | written with echo |
| `kubebook-ch24-web/templates/cond.yaml` | 24.2 › Flow control with if, with and range › In practice (line 181) |  |
| `kubebook-ch24-web/templates/with.yaml` | 24.2 › Flow control with if, with and range › In practice (line 237) |  |
| `kubebook-ch24-web/templates/withif.yaml` | 24.2 › Flow control with if, with and range › In practice (line 248) |  |
| `kubebook-ch24-web/templates/range.yaml` | 24.2 › Flow control with if, with and range › In practice (line 296) |  |
| `kubebook-ch24-web/templates/portmaps.yaml` | 24.2 › Flow control with if, with and range › In practice (line 329) |  |
| `kubebook-ch24-web/templates/vars.yaml` | 24.2 › Variables and named templates › In practice (line 387) |  |
| `kubebook-ch24-web/templates/_helpers.tpl` | 24.2 › Variables and named templates › In practice (line 416) |  |
| `kubebook-ch24-web/templates/named.yaml` | 24.2 › Variables and named templates › In practice (line 438) |  |
| `kubebook-ch24-web/templates/req.yaml` | 24.2 › Variables and named templates › In practice (line 539) |  |
| `kubebook-ch24-conv/values.yaml` | 24.3 › Chart conventions for Pod templates and ServiceAccounts › In practice (line 156) |  |
| `kubebook-ch24-conv/templates/role.yaml` | 24.3 › Chart conventions for Pod templates and ServiceAccounts › In practice (line 160) |  |
| `kubebook-ch24-conv/templates/rolebinding.yaml` | 24.3 › Chart conventions for Pod templates and ServiceAccounts › In practice (line 172) |  |
| `kubebook-ch24-web/Chart.yaml` | 24.3 › Packaging and installing your chart › In practice (line 242) |  |
| `kubebook-ch24-web/templates/deployment.yaml` | 24.3 › Packaging and installing your chart › In practice (line 257) |  |
| `kubebook-ch24-web/templates/service.yaml` | 24.3 › Packaging and installing your chart › In practice (line 283) |  |
| `kubebook-ch24-web/templates/NOTES.txt` | 24.3 › Packaging and installing your chart › In practice (line 298) |  |
| `kubebook-ch24-web/templates/broken.yaml` | 24.3 › Packaging and installing your chart › In practice (line 358) |  |
| `kubebook-ch24-web/.helmignore` | 24.3 › Packaging and installing your chart › In practice (line 438) | written with echo |
| `kubebook-ch24-crd/Chart.yaml` | 24.3 › CRDs in the crds folder, and helm show crds › In practice (line 578) |  |
| `kubebook-ch24-crd/crds/backups.yaml` | 24.3 › CRDs in the crds folder, and helm show crds › In practice (line 696) | rewritten later in the chapter |
| `kubebook-ch24-crd/values.yaml` | 24.3 › CRDs in the crds folder, and helm show crds › In practice (line 611) | written with echo |
| `kubebook-ch24-crd/templates/backup.yaml` | 24.3 › CRDs in the crds folder, and helm show crds › In practice (line 613) |  |
| `kubebook-ch24-web/templates/exercise-chart.yaml` | 24.3 › Try it yourself (line 798) |  |
| `kubebook-ch24-web/templates/exercise-replicas.yaml` | 24.3 › Try it yourself (line 820) |  |
| `kubebook-ch24-web/templates/exercise-labels.yaml` | 24.3 › Try it yourself (line 841) |  |
| `kubebook-ch24-web/templates/_owner.tpl` | 24.3 › Try it yourself (line 864) |  |
| `kubebook-ch24-web/templates/exercise-owner.yaml` | 24.3 › Try it yourself (line 869) |  |
| `kubebook-ch24-web/templates/exercise-required.yaml` | 24.3 › Try it yourself (line 885) |  |
| `kubebook-ch24-web/templates/exercise-types.yaml` | 24.3 › Try it yourself (line 943) |  |
