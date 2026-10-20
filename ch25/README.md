# 25 - Sub-charts, Dependencies, Repositories and Values; Conditions, Tags and Aliases; Importing Values, Library Charts and Starter Charts

The files the chapter **25**, in its parts **25.1 - Sub-charts, Dependencies, Repositories and Values**, **25.2 - Conditions, Tags and Aliases** and **25.3 - Importing Values, Library Charts and Starter Charts**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch25`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- List the charts that one chart needs in `dependencies`, and fetch them with `helm dependency update`, `build` and `list`
- Read `Chart.lock` and the four statuses `ok`, `missing`, `wrong version` and `unpacked`, and write version constraints
- Name a repository as a `file://` path, an https URL, an `@name` or an `oci://` address
- Override a sub-chart's values from the parent chart, and share one value with every chart through `global`
- Switch a sub-chart on and off with `condition` and `tags`
- Say which path decides when a condition lists several, and why a condition beats a tag
- Use one chart twice under two names with `alias`
- Say which names an alias changes: the chart name in the copy, the values key and the `--set` prefix
- Pull values up from a child chart into its parent with `import-values`
- Say what happens to an import when its dependency is switched off
- Share template code with a library chart, and start new charts from a starter chart
- Choose between a library chart and a starter chart

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `frontend/Chart.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 316) | rewritten later in the chapter |
| `frontend/values.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 137) |  |
| `frontend/templates/configmap.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 141) |  |
| `frontend/templates/deployment.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 153) |  |
| `backend/Chart.yaml` | 25.3 › Importing values from a child › In practice (line 76) | rewritten later in the chapter |
| `backend/values.yaml` | 25.3 › Importing values from a child › In practice (line 65) | rewritten later in the chapter |
| `backend/templates/configmap.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 141) |  |
| `backend/templates/deployment.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 153) |  |
| `kubebook-ch25-shop/Chart.yaml` | 25.3 › Try it yourself (line 781) | rewritten later in the chapter |
| `kubebook-ch25-shop/values.yaml` | 25.3 › Try it yourself (line 795) | rewritten later in the chapter |
| `kubebook-ch25-try/Chart.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 432) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-ch25-web/Chart.yaml` | 25.1 › Sub-charts, the dependencies list and Chart.lock › In practice (line 657) | rewritten later in the chapter |
| `kubebook-ch25-shop/templates/parent.yaml` | 25.3 › Try it yourself (line 798) | rewritten later in the chapter |
| `kubebook-ch25-import-toggle/Chart.yaml` | 25.3 › Importing values from a child › When the dependency is disabled (line 229) |  |
| `kubebook-ch25-import-toggle/values.yaml` | 25.3 › Importing values from a child › When the dependency is disabled (line 243) |  |
| `kubebook-ch25-import-toggle/templates/parent.yaml` | 25.3 › Importing values from a child › When the dependency is disabled (line 247) |  |
| `common/Chart.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 351) |  |
| `common/templates/_configmap.tpl` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 357) |  |
| `common/templates/plain.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 369) |  |
| `app/Chart.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 424) |  |
| `app/values.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 433) |  |
| `app/templates/configmap.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 438) |  |
| `common/values.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 470) |  |
| `app/templates/peek.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 475) |  |
| `starters/kubebook-starter/Chart.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 495) |  |
| `starters/kubebook-starter/values.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 501) |  |
| `starters/kubebook-starter/templates/configmap.yaml` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 504) |  |
| `starters/kubebook-starter/templates/_helpers.tpl` | 25.3 › Reusing chart code with library charts and starter charts › In practice (line 512) |  |
| `worker/Chart.yaml` | 25.3 › Try it yourself (line 650) |  |
