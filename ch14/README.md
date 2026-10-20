# 14 - How the Scheduler Decides, nodeSelector, nodeName and Scheduling Gates; Node Affinity, Pod Anti-Affinity and Topology Spread; Taints, Tolerations, Priority and Preemption; Dynamic Resource Allocation - Devices, Claims, Taints and Rights; Static Pods, the Standalone Kubelet and a Scheduler That Stops; Multiple Schedulers, Profiles and Bin Packing

The files the chapter **14**, in its parts **14.1 - How the Scheduler Decides, nodeSelector, nodeName and Scheduling Gates**, **14.2 - Node Affinity, Pod Anti-Affinity and Topology Spread**, **14.3 - Taints, Tolerations, Priority and Preemption**, **14.4 - Dynamic Resource Allocation - Devices, Claims, Taints and Rights**, **14.5 - Static Pods, the Standalone Kubelet and a Scheduler That Stops** and **14.6 - Multiple Schedulers, Profiles and Bin Packing**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch14`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Read how the scheduler filters nodes, scores them and binds a Pod, and read a `FailedScheduling` event
- Steer a Pod with node labels, `nodeSelector` and `nodeName`, and see what `nodeName` skips
- Hold a Pod with scheduling gates, and see which changes a gated Pod accepts
- Write node affinity with `In`, `NotIn` and `Exists`, in the required and the preferred form, and keep replicas apart with Pod anti-affinity
- Spread Pods over zones with `maxSkew` and `minDomains`, and read the message of a Pod that waits
- Taint a node with the three effects, tolerate the taint with `Equal` and `Exists`, and read `tolerationSeconds` at work
- Combine a taint with a label to dedicate a node, and give Pods a priority to watch a high-priority Pod preempt a low-priority one
- Ask for devices with a ResourceClaim, a DeviceClass and a ResourceSlice, and watch the scheduler allocate one
- Read the DRA feature gates, taint a device, try a fallback list and admin access, and read who may write what
- Run a static Pod from a kubelet folder, and see why deleting its mirror changes nothing
- Stop the scheduler by moving its file, and bind a Pod by hand
- Run and remove a static Pod with a standalone kubelet that has no API client
- Run a second scheduler with two profiles, and choose it with `schedulerName`
- Pack Pods onto fewer nodes with `MostAllocated`, and read what `percentageOfNodesToScore` does

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 14.1 › How the scheduler decides › In practice (line 71) |  |
| `sel.yaml` | 14.1 › nodeSelector and nodeName › In practice (line 198) |  |
| `why.sh` | 14.1 › nodeSelector and nodeName › In practice (line 227) |  |
| `named.yaml` | 14.1 › nodeSelector and nodeName › In practice (line 304) |  |
| `gated.yaml` | 14.1 › Pod scheduling readiness - schedulingGates › In practice (line 398) |  |
| `aff.yaml` | 14.2 › Node affinity and Pod anti-affinity › In practice (line 65) |  |
| `notin.yaml` | 14.2 › Node affinity and Pod anti-affinity › In practice (line 105) |  |
| `pref.yaml` | 14.2 › Node affinity and Pod anti-affinity › In practice (line 136) |  |
| `none.yaml` | 14.2 › Node affinity and Pod anti-affinity › In practice (line 178) |  |
| `anti.yaml` | 14.2 › Node affinity and Pod anti-affinity › In practice (line 225) |  |
| `zones.yaml` | 14.2 › Pod topology spread constraints › In practice (line 323) |  |
| `zonecount.sh` | 14.2 › Pod topology spread constraints › In practice (line 351) |  |
| `tol.yaml` | 14.3 › Taints and tolerations › In practice (line 99) |  |
| `notol.yaml` | 14.3 › Taints and tolerations › In practice (line 116) |  |
| `toltime.yaml` | 14.3 › Taints and tolerations › In practice (line 220) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `prio.yaml` | 14.3 › Priority and preemption › In practice (line 378) |  |
| `toohigh.yaml` | 14.3 › Priority and preemption › In practice (line 420) |  |
| `big.yaml` | 14.3 › Priority and preemption › In practice (line 442) |  |
| `dra-driver.yaml` | 14.4 › Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 94) |  |
| `claim.yaml` | 14.4 › Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 234) |  |
| `gpu-pod.yaml` | 14.4 › Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 252) |  |
| `gpu-template.yaml` | 14.4 › Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 337) |  |
| `fpga.yaml` | 14.4 › Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 470) |  |
| `fpga-pod.yaml` | 14.4 › Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 513) |  |
| `choice.yaml` | 14.4 › Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 603) |  |
| `admin.yaml` | 14.4 › Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 641) |  |
| `ext.yaml` | 14.4 › Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 683) |  |
| `static.yaml` | 14.5 › Static Pods, and a scheduler that stops › In practice (line 88) |  |
| `binding.yaml` | 14.5 › Static Pods, and a scheduler that stops › In practice (line 199) |  |
| `check-block0-1.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 291) |  |
| `check-archive.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 299) |  |
| `before-init.sh` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 316) |  |
| `check-block0-2.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 352) |  |
| `kubelet.yaml` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 374) |  |
| `kubebook-standalone.service` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 395) |  |
| `check-block1-1.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 430) |  |
| `receipt.yaml` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 460) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `check-runtime.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 488) |  |
| `check-cleanup.py` | 14.5 › Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 573) |  |
| `my-scheduler.yaml` | 14.6 › Multiple schedulers and scheduler profiles › In practice (line 98) |  |
| `sched-pod.yaml` | 14.6 › Multiple schedulers and scheduler profiles › In practice (line 233) |  |
| `packer-config.yaml` | 14.6 › Resource bin packing and scheduler performance tuning › In practice (line 360) |  |
| `packed.yaml` | 14.6 › Resource bin packing and scheduler performance tuning › In practice (line 409) |  |
| `ex-sel.yaml` | 14.6 › Try it yourself (line 511) |  |
| `ex-notin.yaml` | 14.6 › Try it yourself (line 550) |  |
| `ex-guest.yaml` | 14.6 › Try it yourself (line 597) |  |
| `ex-exec.yaml` | 14.6 › Try it yourself (line 636) |  |
| `ex-static.yaml` | 14.6 › Try it yourself (line 715) |  |
| `ex-held.yaml` | 14.6 › Try it yourself (line 748) |  |
| `ex-even.yaml` | 14.6 › Try it yourself (line 780) |  |
| `ex-dongle.yaml` | 14.6 › Try it yourself (line 825) |  |
| `ratio-config.yaml` | 14.6 › Try it yourself (line 918) |  |
| `ex-ratio.yaml` | 14.6 › Try it yourself (line 939) |  |
