# 34 - A Method for Any Fault, Application Faults and the Control Plane; Worker Node Faults, Network Faults and JSONPath

The files the chapter **34**, in its parts **34.1 - A Method for Any Fault, Application Faults and the Control Plane** and **34.2 - Worker Node Faults, Network Faults and JSONPath**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch34`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

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
| `kind.yaml` | 34.1 › A method for any fault › In practice (line 82) |  |
| `svc.yaml` | 34.1 › A method for any fault › In practice (line 115) |  |
| `chain.sh` | 34.1 › A method for any fault › In practice (line 134) |  |
| `big.yaml` | 34.1 › Application faults: from the Service to the container › In practice (line 409) |  |
| `ex-api.yaml` | 34.2 › Try it yourself (line 537) |  |
| `ex-sel.yaml` | 34.2 › Try it yourself (line 612) |  |
| `ex-pending.yaml` | 34.2 › Try it yourself (line 688) |  |
