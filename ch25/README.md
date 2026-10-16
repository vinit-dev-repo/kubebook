# 25 - Helm Dependencies - Sub-charts, Aliases, Conditions, Tags, Global and Imported Values, and Starter Charts

The files the chapter **25 - Helm Dependencies - Sub-charts, Aliases, Conditions, Tags, Global and Imported Values, and Starter Charts** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch25`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- List the charts that one chart needs in `dependencies`, and fetch them with `helm dependency update`, `build` and `list`
- Read `Chart.lock` and the four statuses `ok`, `missing`, `wrong version` and `unpacked`, and write version constraints
- Name a repository as a `file://` path, an https URL, an `@name` or an `oci://` address
- Override a sub-chart's values from the parent chart, and share one value with every chart through `global`
- Switch a sub-chart on and off with `condition` and `tags`
- Use one chart twice under two names with `alias`
- Pull values up from a child chart into its parent with `import-values`
- Share template code with a library chart, and start new charts from a starter chart

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `frontend/Chart.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 329) | rewritten later in the chapter |
| `frontend/values.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 142) |  |
| `frontend/templates/configmap.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 146) |  |
| `frontend/templates/deployment.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 158) |  |
| `backend/Chart.yaml` | Importing values from a child › In practice (line 1515) | rewritten later in the chapter |
| `backend/values.yaml` | Importing values from a child › In practice (line 1504) | rewritten later in the chapter |
| `backend/templates/configmap.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 146) |  |
| `backend/templates/deployment.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 158) |  |
| `kubebook-ch25-shop/Chart.yaml` | Try it yourself (line 2216) | rewritten later in the chapter |
| `kubebook-ch25-shop/values.yaml` | Try it yourself (line 2230) | rewritten later in the chapter |
| `kubebook-ch25-try/Chart.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 447) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `kubebook-ch25-web/Chart.yaml` | Sub-charts, the dependencies list and Chart.lock › In practice (line 678) | rewritten later in the chapter |
| `kubebook-ch25-shop/templates/parent.yaml` | Try it yourself (line 2233) | rewritten later in the chapter |
| `kubebook-ch25-import-toggle/Chart.yaml` | Importing values from a child › When the dependency is disabled (line 1669) |  |
| `kubebook-ch25-import-toggle/values.yaml` | Importing values from a child › When the dependency is disabled (line 1683) |  |
| `kubebook-ch25-import-toggle/templates/parent.yaml` | Importing values from a child › When the dependency is disabled (line 1687) |  |
| `common/Chart.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1785) |  |
| `common/templates/_configmap.tpl` | Reusing chart code with library charts and starter charts › In practice (line 1791) |  |
| `common/templates/plain.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1803) |  |
| `app/Chart.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1858) |  |
| `app/values.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1867) |  |
| `app/templates/configmap.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1872) |  |
| `common/values.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1905) |  |
| `app/templates/peek.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1910) |  |
| `starters/kubebook-starter/Chart.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1931) |  |
| `starters/kubebook-starter/values.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1937) |  |
| `starters/kubebook-starter/templates/configmap.yaml` | Reusing chart code with library charts and starter charts › In practice (line 1940) |  |
| `starters/kubebook-starter/templates/_helpers.tpl` | Reusing chart code with library charts and starter charts › In practice (line 1948) |  |
| `worker/Chart.yaml` | Try it yourself (line 2085) |  |
