# 26 - Helm Lifecycle and Distribution - Hooks, Tests, Resource Policy, Plugins, Signing, Repositories, OCI and Schema Validation

Files this chapter writes in its blocks, extracted byte for byte from the certified chapter. The chapter itself explains every line; read it in the tutorial. The blocks `cat` these files into a work folder `~/kubebook-ch26`; cloning this folder there gives the same result.

- `kubebook-ch26-hooks/Chart.yaml`
- `kubebook-ch26-hooks/values.yaml`
- `kubebook-ch26-hooks/templates/configmap.yaml`
- `kubebook-ch26-hooks/templates/pre-install.yaml`
- `kubebook-ch26-policy/Chart.yaml`
- `kubebook-ch26-policy/values.yaml`
- `kubebook-ch26-policy/templates/keep.yaml`
- `kubebook-ch26-policy/templates/explode.yaml`
- `kubebook-ch26-weights/Chart.yaml`
- `kubebook-ch26-weights/templates/configmap.yaml`
- `kubebook-ch26-weights/templates/alpha.yaml`
- `kubebook-ch26-tested/Chart.yaml`
- `kubebook-ch26-tested/templates/web.yaml`
- `kubebook-ch26-tested/templates/tests/test-web.yaml`
- `kubebook-ch26-keep/Chart.yaml`
- `kubebook-ch26-keep/templates/maps.yaml`
- `kubebook-ch26-schema/values.schema.json`
- `kubebook-ch26-schema/values.schema.json`
- `kubebook-ch26-schema/values.schema.json`
- `kubebook-hi/plugin.yaml`
- `kubebook-hi/hi.sh`
- `kubebook-ch26-diff/Chart.yaml`
- `kubebook-ch26-diff/values.yaml`
- `kubebook-ch26-diff/templates/cm.yaml`
- `ex/kubebook-ch26-exone/templates/configmap.yaml`
- `ex/kubebook-ch26-exone/templates/post-upgrade.yaml`
- `ex/kubebook-ch26-extwo/templates/tests/test-bad.yaml`
- `ex/kubebook-ch26-exthree/values.schema.json`
- `ex/kubebook-ns/plugin.yaml`
- `ex/kubebook-ns/ns.sh`

Notes on this folder:

- The chapter makes some files from others with `sed`: the hook Jobs `post-install.yaml`, `pre-upgrade.yaml` and `post-delete.yaml` from `pre-install.yaml`, the policy Jobs `default.yaml` and `gone.yaml` from `keep.yaml`, and the weight Jobs `bravo.yaml` and `charlie.yaml` from `alpha.yaml`. Run those `sed` lines from the chapter.
- `kubebook-ch26-schema/values.schema.json` belongs in a chart made with `helm create kubebook-ch26-schema`; it is the schema that closes the `image` map. The chapter also shows a schema that closes the top level, on purpose, to show why that breaks a `helm create` chart.
- `kubebook-ch26-signed`, `kubebook-ch26-web` and the exercise charts are made with `helm create`; the keys, packages and the registry password are made by the chapter's blocks and are never stored here.
