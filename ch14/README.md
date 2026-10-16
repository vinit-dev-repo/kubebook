# 14 - Scheduling - Node Selectors, Affinity, Taints and Tolerations, Priority, Static Pods and Multiple Schedulers

The files the chapter **14 - Scheduling - Node Selectors, Affinity, Taints and Tolerations, Priority, Static Pods and Multiple Schedulers** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch14`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Read how the scheduler filters nodes, scores them and binds a Pod, and read a `FailedScheduling` event
- Steer a Pod with node labels, `nodeSelector` and `nodeName`, and see what `nodeName` skips
- Write node affinity with `In`, `NotIn` and `Exists`, in required and preferred form, and keep Pods apart with Pod anti-affinity
- Taint a node with the three effects, tolerate the taint with `Equal` and `Exists`, and read `tolerationSeconds` at work
- Combine a taint with a label to dedicate a node, and know why taints repel while affinity attracts
- Give Pods a priority, and watch a high-priority Pod preempt a low-priority one
- Run a static Pod from a kubelet folder, then stop the scheduler and bind a Pod by hand
- Run and remove a static Pod with a standalone kubelet
- Run a second scheduler with two profiles, and choose it with `schedulerName`
- Hold a Pod with scheduling gates, and spread Pods over zones with `maxSkew` and `minDomains`
- Ask for devices with DRA claims, classes and slices, and read DRA gates, device taints and rights
- Pack Pods onto fewer nodes with `MostAllocated`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | How the scheduler decides › In practice (line 80) |  |
| `sel.yaml` | nodeSelector and nodeName › In practice (line 204) |  |
| `why.sh` | nodeSelector and nodeName › In practice (line 230) |  |
| `named.yaml` | nodeSelector and nodeName › In practice (line 311) |  |
| `gated.yaml` | Pod scheduling readiness - schedulingGates › In practice (line 399) |  |
| `aff.yaml` | Node affinity and Pod anti-affinity › In practice (line 510) |  |
| `notin.yaml` | Node affinity and Pod anti-affinity › In practice (line 551) |  |
| `pref.yaml` | Node affinity and Pod anti-affinity › In practice (line 583) |  |
| `none.yaml` | Node affinity and Pod anti-affinity › In practice (line 626) |  |
| `anti.yaml` | Node affinity and Pod anti-affinity › In practice (line 675) |  |
| `zones.yaml` | Pod topology spread constraints › In practice (line 771) |  |
| `zonecount.sh` | Pod topology spread constraints › In practice (line 799) |  |
| `tol.yaml` | Taints and tolerations › In practice (line 957) |  |
| `notol.yaml` | Taints and tolerations › In practice (line 974) |  |
| `toltime.yaml` | Taints and tolerations › In practice (line 1080) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `prio.yaml` | Priority and preemption › In practice (line 1234) |  |
| `toohigh.yaml` | Priority and preemption › In practice (line 1276) |  |
| `big.yaml` | Priority and preemption › In practice (line 1297) |  |
| `dra-driver.yaml` | Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 1455) |  |
| `claim.yaml` | Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 1595) |  |
| `gpu-pod.yaml` | Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 1613) |  |
| `gpu-template.yaml` | Dynamic Resource Allocation - DeviceClasses, ResourceSlices and ResourceClaims › In practice (line 1701) |  |
| `fpga.yaml` | Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 1832) |  |
| `fpga-pod.yaml` | Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 1876) |  |
| `choice.yaml` | Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 1969) |  |
| `admin.yaml` | Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 2007) |  |
| `ext.yaml` | Dynamic Resource Allocation in depth - device taints, feature gates, observability and hardening › In practice (line 2049) |  |
| `static.yaml` | Static Pods, and a scheduler that stops › In practice (line 2191) |  |
| `binding.yaml` | Static Pods, and a scheduler that stops › In practice (line 2307) |  |
| `check-block0-1.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2398) |  |
| `check-archive.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2406) |  |
| `before-init.sh` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2423) |  |
| `check-block0-2.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2459) |  |
| `kubelet.yaml` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2480) |  |
| `kubebook-standalone.service` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2501) |  |
| `check-block1-1.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2536) |  |
| `receipt.yaml` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2567) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `check-runtime.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2595) |  |
| `check-cleanup.py` | Static Pods, and a scheduler that stops › Run a kubelet without a control-plane connection (line 2682) |  |
| `my-scheduler.yaml` | Multiple schedulers and scheduler profiles › In practice (line 2780) |  |
| `sched-pod.yaml` | Multiple schedulers and scheduler profiles › In practice (line 2915) |  |
| `packer-config.yaml` | Resource bin packing and scheduler performance tuning › In practice (line 3038) |  |
| `packed.yaml` | Resource bin packing and scheduler performance tuning › In practice (line 3088) |  |
| `ex-sel.yaml` | Try it yourself (line 3204) |  |
| `ex-notin.yaml` | Try it yourself (line 3243) |  |
| `ex-guest.yaml` | Try it yourself (line 3290) |  |
| `ex-exec.yaml` | Try it yourself (line 3329) |  |
| `ex-static.yaml` | Try it yourself (line 3408) |  |
| `ex-held.yaml` | Try it yourself (line 3441) |  |
| `ex-even.yaml` | Try it yourself (line 3473) |  |
| `ex-dongle.yaml` | Try it yourself (line 3518) |  |
| `ratio-config.yaml` | Try it yourself (line 3611) |  |
| `ex-ratio.yaml` | Try it yourself (line 3632) |  |
