# 42 - Runtime Security - Falco, Sysdig and Audit Logs

The files the chapter **42 - Runtime Security - Falco, Sysdig and Audit Logs** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch42`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what Falco watches, why its driver needs a privileged Pod, and install it with Helm from a chart file that you download
- Read a Falco alert, and trigger the default rule for a sensitive file
- Write rules of your own with a list, a macro, a condition and an output, and catch a process that opens `/dev/mem`
- Read the Falco configuration file: the rule files in order, the output channels, the priority filter and the capture settings
- Say why live Sysdig capture fails on the Ubuntu machine, and read a Falco capture file with Sysdig in a container
- Answer four questions about a cluster from the API server's audit log with `jq`
- Send the audit log to Falco through a webhook, and read the alerts that it raises

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `values.yaml` | Runtime detection with Falco › In practice (line 97) |  |
| `ev.sh` | Runtime detection with Falco › In practice (line 179) |  |
| `kubebook-rules.yaml` | Writing Falco rules › In practice (line 235) |  |
| `rules-values.sh` | Writing Falco rules › In practice (line 259) |  |
| `priv.yaml` | Writing Falco rules › In practice (line 316) |  |
| `channel-query-0.jq` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 454) |  |
| `channel-query-1.jq` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 458) |  |
| `channel-query-2.jq` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 462) |  |
| `channel-query-3.jq` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 466) |  |
| `channel-helper.sh` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 470) |  |
| `channel-off.yaml` | Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 515) |  |
| `capture-settings.yaml` | Falco's configuration and outputs › Capture a matching rule (line 642) |  |
| `reader42-capture-settings.yaml` | Sysdig and capture files › Finish reading a capture with the matching library (line 800) |  |
| `audit-policy.yaml` | Reading the audit log in depth › In practice (line 1019) |  |
| `audit-mounts.txt` | Reading the audit log in depth › In practice (line 1046) |  |
| `audit-volumes.txt` | Reading the audit log in depth › In practice (line 1053) |  |
| `wait-apiserver.sh` | Reading the audit log in depth › In practice (line 1063) |  |
| `audit-on.sh` | Reading the audit log in depth › In practice (line 1079) |  |
| `q.sh` | Reading the audit log in depth › In practice (line 1159) |  |
| `values-audit.yaml` | Alerting on the audit log › In practice (line 1233) |  |
| `webhook.kubeconfig` | Alerting on the audit log › In practice (line 1332) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-rules.yaml` | Try it yourself (line 1473) |  |
| `readers.jq` | Try it yourself (line 1523) |  |
