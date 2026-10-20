# 42 - Runtime Detection with Falco and Writing Rules; Falco Configuration, Output Channels, Sysdig and Capture Files; Reading the Audit Log and Alerting on It

The files the chapter **42**, in its parts **42.1 - Runtime Detection with Falco and Writing Rules**, **42.2 - Falco Configuration, Output Channels, Sysdig and Capture Files** and **42.3 - Reading the Audit Log and Alerting on It**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch42`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what Falco watches, why its driver needs a privileged Pod, and install it with Helm from a chart file that you download
- Read a Falco alert as text and as JSON, and trigger the default rule for a sensitive file
- Write rules of your own with a list, a macro, a condition and an output
- Catch a write below `/etc` and a process that opens `/dev/mem`
- Read the Falco configuration file: the rule files in order, the output channels, the priority filter and the capture settings
- Find a missing alert by reading the output channels, with a file channel that holds the alert and a standard output that does not
- Switch a capture on for one rule, and say why live Sysdig capture fails on the Ubuntu machine
- Read a Falco capture file with Sysdig in a container, and read it to its end with a reader of your own
- Answer four questions about a cluster from the audit log of the API server with `jq`
- Switch auditing on by editing the manifest of a running API server, with a safe copy and a trap
- Send the audit log to Falco through a webhook, and read the alerts that it raises
- Work the exercises of the whole chapter: a shell rule, a capture, a Secret reader, a log rule and a NodePort

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `values.yaml` | 42.1 › Runtime detection with Falco › In practice (line 100) |  |
| `ev.sh` | 42.1 › Runtime detection with Falco › In practice (line 181) |  |
| `kubebook-rules.yaml` | 42.1 › Writing Falco rules › In practice (line 249) |  |
| `rules-values.sh` | 42.1 › Writing Falco rules › In practice (line 274) |  |
| `priv.yaml` | 42.1 › Writing Falco rules › In practice (line 328) |  |
| `channel-query-0.jq` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 140) |  |
| `channel-query-1.jq` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 144) |  |
| `channel-query-2.jq` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 148) |  |
| `channel-query-3.jq` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 152) |  |
| `channel-helper.sh` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 156) |  |
| `channel-off.yaml` | 42.2 › Falco's configuration and outputs › Diagnose a missing Falco alert by its output channel (line 201) |  |
| `capture-settings.yaml` | 42.2 › Falco's configuration and outputs › Capture a matching rule (line 327) |  |
| `reader42-capture-settings.yaml` | 42.2 › Sysdig and capture files › Finish reading a capture with the matching library (line 500) |  |
| `audit-policy.yaml` | 42.3 › Reading the audit log in depth › In practice (line 116) |  |
| `audit-mounts.txt` | 42.3 › Reading the audit log in depth › In practice (line 143) |  |
| `audit-volumes.txt` | 42.3 › Reading the audit log in depth › In practice (line 150) |  |
| `wait-apiserver.sh` | 42.3 › Reading the audit log in depth › In practice (line 160) |  |
| `audit-on.sh` | 42.3 › Reading the audit log in depth › In practice (line 176) |  |
| `q.sh` | 42.3 › Reading the audit log in depth › In practice (line 253) |  |
| `values-audit.yaml` | 42.3 › Alerting on the audit log › In practice (line 342) |  |
| `webhook.kubeconfig` | 42.3 › Alerting on the audit log › In practice (line 440) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `ex-rules.yaml` | 42.3 › Try it yourself (line 580) |  |
| `readers.jq` | 42.3 › Try it yourself (line 630) |  |
