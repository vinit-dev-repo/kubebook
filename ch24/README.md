# 24 - Writing Helm Charts - Structure, Built-in Objects, Functions, Flow Control, Variables and Named Templates

The files the chapter **24 - Writing Helm Charts - Structure, Built-in Objects, Functions, Flow Control, Variables and Named Templates** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch24`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Read the folder of a chart and say what `Chart.yaml`, `values.yaml`, `templates/`, `_helpers.tpl`, `NOTES.txt`, `charts/` and `.helmignore` are for
- Make a chart with `helm create`, check it with `helm lint`, and look at its objects with `helm template` and `--show-only`
- Read the built-in objects `.Release`, `.Chart`, `.Values`, `.Capabilities`, `.Template` and `.Files`, and say what the dot means
- Write actions and pipelines with `quote`, `default`, `printf`, `indent`, `nindent` and `toYaml`, and control whitespace with a dash
- Write `if`, `else`, `with` and `range` blocks, and reach the root object from inside them with `$`
- Keep a value in a variable, write a named template with `define`, and choose `include` over `template`
- Stop a bad render early with `required` and `fail`, and read the errors that Helm prints
- Package a chart, install it from the package, and upgrade the release to a newer package

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kubebook-ch24-web/values.yaml` | Built-in objects and the dot › In practice (line 353) | the chapter adds to it in later blocks |
| `kubebook-ch24-web/config/app.txt` | Built-in objects and the dot › In practice (line 368) | written with printf |
| `kubebook-ch24-web/templates/objects.yaml` | Built-in objects and the dot › In practice (line 378) |  |
| `kubebook-ch24-web/templates/files.yaml` | Built-in objects and the dot › In practice (line 441) |  |
| `kubebook-ch24-web/templates/fns.yaml` | Actions, pipelines, functions and whitespace › In practice (line 494) |  |
| `kubebook-ch24-web/templates/bad.yaml` | Variables and named templates › In practice (line 1378) | rewritten later in the chapter |
| `kubebook-ch24-web/templates/ws.yaml` | Actions, pipelines, functions and whitespace › In practice (line 595) |  |
| `kubebook-ch24-yaml-guard/source/Chart.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 694) |  |
| `kubebook-ch24-yaml-guard/source/values.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 699) |  |
| `kubebook-ch24-yaml-guard/source/templates/unsafe.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 704) |  |
| `kubebook-ch24-yaml-guard/source/templates/quoted.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 712) |  |
| `kubebook-ch24-yaml-guard/source/templates/block.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 720) |  |
| `kubebook-ch24-yaml-guard/source/templates/typed.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 729) |  |
| `kubebook-ch24-yaml-guard/check/Chart.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 737) |  |
| `kubebook-ch24-yaml-guard/check/templates/check.yaml` | Actions, pipelines, functions and whitespace › When a value changes the shape of YAML (line 742) |  |
| `kubebook-ch24-tpl/Chart.yaml` | Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 830) |  |
| `kubebook-ch24-tpl/values.yaml` | Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 835) |  |
| `kubebook-ch24-tpl/templates/config.yaml` | Actions, pipelines, functions and whitespace › Evaluate a template held in a value (line 838) |  |
| `kubebook-ch24-web/templates/types.yaml` | Value types, and finding them with typeOf, kindOf and printf › In practice (line 890) |  |
| `three.yaml` | Value types, and finding them with typeOf, kindOf and printf › In practice (line 916) | written with echo |
| `kubebook-ch24-web/templates/convert.yaml` | Value types, and finding them with typeOf, kindOf and printf › In practice (line 961) |  |
| `big.yaml` | Value types, and finding them with typeOf, kindOf and printf › In practice (line 964) | written with echo |
| `kubebook-ch24-web/templates/cond.yaml` | Flow control with if, with and range › In practice (line 1001) |  |
| `kubebook-ch24-web/templates/with.yaml` | Flow control with if, with and range › In practice (line 1058) |  |
| `kubebook-ch24-web/templates/withif.yaml` | Flow control with if, with and range › In practice (line 1069) |  |
| `kubebook-ch24-web/templates/range.yaml` | Flow control with if, with and range › In practice (line 1118) |  |
| `kubebook-ch24-web/templates/portmaps.yaml` | Flow control with if, with and range › In practice (line 1152) |  |
| `kubebook-ch24-web/templates/vars.yaml` | Variables and named templates › In practice (line 1200) |  |
| `kubebook-ch24-web/templates/_helpers.tpl` | Variables and named templates › In practice (line 1226) |  |
| `kubebook-ch24-web/templates/named.yaml` | Variables and named templates › In practice (line 1245) |  |
| `kubebook-ch24-web/templates/req.yaml` | Variables and named templates › In practice (line 1346) |  |
| `kubebook-ch24-conv/values.yaml` | Chart conventions for Pod templates and ServiceAccounts › In practice (line 1512) |  |
| `kubebook-ch24-conv/templates/role.yaml` | Chart conventions for Pod templates and ServiceAccounts › In practice (line 1516) |  |
| `kubebook-ch24-conv/templates/rolebinding.yaml` | Chart conventions for Pod templates and ServiceAccounts › In practice (line 1528) |  |
| `kubebook-ch24-web/Chart.yaml` | Packaging and installing your chart › In practice (line 1595) |  |
| `kubebook-ch24-web/templates/deployment.yaml` | Packaging and installing your chart › In practice (line 1609) |  |
| `kubebook-ch24-web/templates/service.yaml` | Packaging and installing your chart › In practice (line 1635) |  |
| `kubebook-ch24-web/templates/NOTES.txt` | Packaging and installing your chart › In practice (line 1650) |  |
| `kubebook-ch24-web/templates/broken.yaml` | Packaging and installing your chart › In practice (line 1712) |  |
| `kubebook-ch24-web/.helmignore` | Packaging and installing your chart › In practice (line 1796) | written with echo |
| `kubebook-ch24-crd/Chart.yaml` | CRDs in the crds folder, and helm show crds › In practice (line 1935) |  |
| `kubebook-ch24-crd/crds/backups.yaml` | CRDs in the crds folder, and helm show crds › In practice (line 2058) | rewritten later in the chapter |
| `kubebook-ch24-crd/values.yaml` | CRDs in the crds folder, and helm show crds › In practice (line 1968) | written with echo |
| `kubebook-ch24-crd/templates/backup.yaml` | CRDs in the crds folder, and helm show crds › In practice (line 1970) |  |
| `kubebook-ch24-web/templates/exercise-chart.yaml` | Try it yourself (line 2166) |  |
| `kubebook-ch24-web/templates/exercise-replicas.yaml` | Try it yourself (line 2188) |  |
| `kubebook-ch24-web/templates/exercise-labels.yaml` | Try it yourself (line 2209) |  |
| `kubebook-ch24-web/templates/_owner.tpl` | Try it yourself (line 2232) |  |
| `kubebook-ch24-web/templates/exercise-owner.yaml` | Try it yourself (line 2237) |  |
| `kubebook-ch24-web/templates/exercise-required.yaml` | Try it yourself (line 2253) |  |
| `kubebook-ch24-web/templates/exercise-types.yaml` | Try it yourself (line 2311) |  |
