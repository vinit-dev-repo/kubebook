# 26 - Hooks, Delete Policies, Weights and Configuration Rollouts; Chart Tests, Resource Policy, Schema Validation and Signing; Hosting Charts, Registries and Plugins

The files the chapter **26**, in its parts **26.1 - Hooks, Delete Policies, Weights and Configuration Rollouts**, **26.2 - Chart Tests, Resource Policy, Schema Validation and Signing** and **26.3 - Hosting Charts, Registries and Plugins**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch26`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say where each hook runs in a release, and write a hook Job for an install, an upgrade or a delete
- Control hook objects with delete policies and weights, and read what a failing hook does to a release
- Trigger a Pod replacement when chart configuration changes, and verify the new startup value
- Install Helm 4 and make the cluster `kubebook-ch26` that the chapter uses
- Test a release with `helm test`, read its logs and run only the tests you choose
- Keep an object alive after an uninstall with a resource policy
- Refuse wrong values with a `values.schema.json` file
- Sign a chart with a throw-away gpg key, verify it, and see what a changed archive or a wrong key does
- Serve your own chart repository, then push the same chart to an OCI registry, with and without a password
- Pull a package, add a version with `helm repo index --merge`, and install from a repository
- Write, install and run a Helm plugin, and install the public plugin `helm-diff`
- Check a plugin's provenance before you trust its code

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kubebook-ch26-hooks/Chart.yaml` | 26.1 › Hooks, and the points in a release where they run › In practice (line 169) |  |
| `kubebook-ch26-hooks/values.yaml` | 26.1 › Hooks, and the points in a release where they run › In practice (line 174) |  |
| `kubebook-ch26-hooks/templates/configmap.yaml` | 26.1 › Hooks, and the points in a release where they run › In practice (line 177) |  |
| `kubebook-ch26-hooks/templates/pre-install.yaml` | 26.1 › Hooks, and the points in a release where they run › In practice (line 185) |  |
| `kubebook-ch26-policy/Chart.yaml` | 26.1 › Hook delete policies and weights › In practice (line 405) |  |
| `kubebook-ch26-policy/values.yaml` | 26.1 › Hook delete policies and weights › In practice (line 410) |  |
| `kubebook-ch26-policy/templates/keep.yaml` | 26.1 › Hook delete policies and weights › In practice (line 413) |  |
| `kubebook-ch26-policy/templates/explode.yaml` | 26.1 › Hook delete policies and weights › In practice (line 433) |  |
| `kubebook-ch26-weights/Chart.yaml` | 26.1 › Hook delete policies and weights › In practice (line 530) |  |
| `kubebook-ch26-weights/templates/configmap.yaml` | 26.1 › Hook delete policies and weights › In practice (line 535) |  |
| `kubebook-ch26-weights/templates/alpha.yaml` | 26.1 › Hook delete policies and weights › In practice (line 543) |  |
| `kubebook-ch26-config-roll/Chart.yaml` | 26.1 › Rolling out a configuration change › In practice (line 626) |  |
| `kubebook-ch26-config-roll/values.yaml` | 26.1 › Rolling out a configuration change › In practice (line 631) |  |
| `kubebook-ch26-config-roll/templates/configmap.yaml` | 26.1 › Rolling out a configuration change › In practice (line 634) |  |
| `kubebook-ch26-config-roll/templates/deployment.yaml` | 26.1 › Rolling out a configuration change › In practice (line 642) |  |
| `kubebook-ch26-tested/Chart.yaml` | 26.2 › Chart tests with helm test › In practice (line 61) |  |
| `kubebook-ch26-tested/templates/web.yaml` | 26.2 › Chart tests with helm test › In practice (line 66) |  |
| `kubebook-ch26-tested/templates/tests/test-web.yaml` | 26.2 › Chart tests with helm test › In practice (line 94) |  |
| `kubebook-ch26-keep/Chart.yaml` | 26.2 › Keeping a resource with a resource policy › In practice (line 229) |  |
| `kubebook-ch26-keep/templates/maps.yaml` | 26.2 › Keeping a resource with a resource policy › In practice (line 234) |  |
| `kubebook-ch26-schema/values.schema.json` | 26.2 › Checking values with a JSON schema › In practice (line 502) | rewritten later in the chapter |
| `unpacked/kubebook-ch26-signed/values.yaml` | 26.2 › Signing and verifying a chart › In practice (line 642) | written with echo |
| `kubebook-hi/plugin.yaml` | 26.3 › Plugins that add commands to Helm › In practice (line 526) |  |
| `kubebook-hi/hi.sh` | 26.3 › Plugins that add commands to Helm › In practice (line 544) |  |
| `kubebook-ch26-diff/Chart.yaml` | 26.3 › Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 765) |  |
| `kubebook-ch26-diff/values.yaml` | 26.3 › Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 770) |  |
| `kubebook-ch26-diff/templates/cm.yaml` | 26.3 › Plugins that add commands to Helm › Check a plugin's provenance before trusting its code (line 773) |  |
| `ex/kubebook-ch26-exone/Chart.yaml` | 26.3 › Try it yourself (line 907) | written with printf |
| `ex/kubebook-ch26-exone/values.yaml` | 26.3 › Try it yourself (line 908) | written with printf |
| `ex/kubebook-ch26-exone/templates/configmap.yaml` | 26.3 › Try it yourself (line 910) |  |
| `ex/kubebook-ch26-exone/templates/post-upgrade.yaml` | 26.3 › Try it yourself (line 918) |  |
| `ex/kubebook-ch26-extwo/templates/tests/test-bad.yaml` | 26.3 › Try it yourself (line 965) |  |
| `ex/kubebook-ch26-exthree/values.schema.json` | 26.3 › Try it yourself (line 1008) |  |
| `ex/kubebook-ns/plugin.yaml` | 26.3 › Try it yourself (line 1056) |  |
| `ex/kubebook-ns/ns.sh` | 26.3 › Try it yourself (line 1074) |  |
| `ex/changed/kubebook-ch26-exsix-0.1.0.tgz` | 26.3 › Try it yourself (line 1116) | written with printf |
