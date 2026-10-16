# 34 - Troubleshooting - Applications, the Control Plane, Worker Nodes and the Network, with JSONPath

The files the chapter **34 - Troubleshooting - Applications, the Control Plane, Worker Nodes and the Network, with JSONPath** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch34`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Follow one five-step method for any fault, from the user's side inwards
- Find an application fault along the chain from a Service to a container. The faults are a wrong selector, a wrong port, a bad image tag, a missing variable and a Pod too big for any node
- Tell which part of the control plane has stopped from the symptom, and read the log of its static Pod through `kubectl` and through `crictl`
- Find a worker node fault from the node's conditions, its taints and the kubelet's journal. Repair a stopped kubelet and a broken kubelet config
- Check the network in order: endpoints, CoreDNS, kube-proxy and the Pod network. Repair a broken kube-proxy and a CoreDNS at zero
- Read exactly one field of any object with JSONPath, `range`, filters, custom columns, `--sort-by` and a Go template

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | A method for any fault › In practice (line 86) |  |
| `svc.yaml` | A method for any fault › In practice (line 121) |  |
| `chain.sh` | A method for any fault › In practice (line 139) |  |
| `big.yaml` | Application faults: from the Service to the container › In practice (line 382) |  |
| `ex-api.yaml` | Try it yourself (line 1005) |  |
| `ex-sel.yaml` | Try it yourself (line 1080) |  |
| `ex-pending.yaml` | Try it yourself (line 1156) |  |
