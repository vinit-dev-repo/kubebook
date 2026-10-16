# 26 - Helm Lifecycle and Distribution - Hooks, Tests, Resource Policy, Plugins, Signing, Repositories, OCI and Schema Validation

The files the chapter **26 - Helm Lifecycle and Distribution - Hooks, Tests, Resource Policy, Plugins, Signing, Repositories, OCI and Schema Validation** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch26`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say where each hook runs in a release, and write a hook Job for an install, an upgrade or a delete
- Control hook objects with delete policies and weights, and read what a failing hook does to a release
- Trigger a Pod replacement when chart configuration changes, and verify the new startup value
- Test a release with `helm test`, read its logs and run only the tests you choose
- Keep an object alive after an uninstall with a resource policy
- Refuse wrong values with a `values.schema.json` file
- Sign a chart with a throw-away gpg key, verify it, and see what a changed archive or a wrong key does
- Serve your own chart repository, then push the same chart to an OCI registry, with and without a password
- Write, install and run a Helm plugin, and install the public plugin `helm-diff`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kubebook-ch26-hooks/Chart.yaml` | Hooks, and the points in a release where they run › In practice (line 177) |  |
| `kubebook-ch26-hooks/values.yaml` | Hooks, and the points in a release where they run › In practice (line 182) |  |
| `kubebook-ch26-hooks/templates/configmap.yaml` | Hooks, and the points in a release where they run › In practice (line 185) |  |
| `kubebook-ch26-hooks/templates/pre-install.yaml` | Hooks, and the points in a release where they run › In practice (line 193) |  |
| `kubebook-ch26-policy/Chart.yaml` | Hook delete policies and weights › In practice (line 413) |  |
| `kubebook-ch26-policy/values.yaml` | Hook delete policies and weights › In practice (line 418) |  |
| `kubebook-ch26-policy/templates/keep.yaml` | Hook delete policies and weights › In practice (line 421) |  |
| `kubebook-ch26-policy/templates/explode.yaml` | Hook delete policies and weights › In practice (line 441) |  |
| `kubebook-ch26-weights/Chart.yaml` | Hook delete policies and weights › In practice (line 540) |  |
| `kubebook-ch26-weights/templates/configmap.yaml` | Hook delete policies and weights › In practice (line 545) |  |
| `kubebook-ch26-weights/templates/alpha.yaml` | Hook delete policies and weights › In practice (line 553) |  |
| `kubebook-ch26-config-roll/Chart.yaml` | Rolling out a configuration change › In practice (line 634) |  |
| `kubebook-ch26-config-roll/values.yaml` | Rolling out a configuration change › In practice (line 639) |  |
| `kubebook-ch26-config-roll/templates/configmap.yaml` | Rolling out a configuration change › In practice (line 642) |  |
| `kubebook-ch26-config-roll/templates/deployment.yaml` | Rolling out a configuration change › In practice (line 650) |  |
| `kubebook-ch26-tested/Chart.yaml` | Chart tests with helm test › In practice (line 799) |  |
| `kubebook-ch26-tested/templates/web.yaml` | Chart tests with helm test › In practice (line 804) |  |
| `kubebook-ch26-tested/templates/tests/test-web.yaml` | Chart tests with helm test › In practice (line 832) |  |
| `kubebook-ch26-keep/Chart.yaml` | Keeping a resource with a resource policy › In practice (line 968) |  |
| `kubebook-ch26-keep/templates/maps.yaml` | Keeping a resource with a resource policy › In practice (line 973) |  |
| `kubebook-ch26-schema/values.schema.json` | Checking values with a JSON schema › In practice (line 1240) | rewritten later in the chapter |
| `unpacked/kubebook-ch26-signed/values.yaml` | Signing and verifying a chart › In practice (line 1377) | written with echo |
| `kubebook-hi/plugin.yaml` | Plugins that add commands to Helm › In practice (line 1953) |  |
| `kubebook-hi/hi.sh` | Plugins that add commands to Helm › In practice (line 1971) |  |
| `kubebook-ch26-diff/Chart.yaml` | Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 2201) |  |
| `kubebook-ch26-diff/values.yaml` | Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 2206) |  |
| `kubebook-ch26-diff/templates/cm.yaml` | Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 2209) |  |
| `ex/kubebook-ch26-exone/Chart.yaml` | Try it yourself (line 2343) | written with printf |
| `ex/kubebook-ch26-exone/values.yaml` | Try it yourself (line 2344) | written with printf |
| `ex/kubebook-ch26-exone/templates/configmap.yaml` | Try it yourself (line 2346) |  |
| `ex/kubebook-ch26-exone/templates/post-upgrade.yaml` | Try it yourself (line 2354) |  |
| `ex/kubebook-ch26-extwo/templates/tests/test-bad.yaml` | Try it yourself (line 2401) |  |
| `ex/kubebook-ch26-exthree/values.schema.json` | Try it yourself (line 2444) |  |
| `ex/kubebook-ns/plugin.yaml` | Try it yourself (line 2492) |  |
| `ex/kubebook-ns/ns.sh` | Try it yourself (line 2510) |  |
| `ex/changed/kubebook-ch26-exsix-0.1.0.tgz` | Try it yourself (line 2552) | written with printf |
