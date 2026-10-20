# 13 - Requests, Limits, the Pod Budget and Extended Resources; What a Limit Does and Node-Pressure Eviction; LimitRange, ResourceQuota and Storage Limits; Metrics and the HorizontalPodAutoscaler; In-Place Resize and the VerticalPodAutoscaler

The files the chapter **13**, in its parts **13.1 - Requests, Limits, the Pod Budget and Extended Resources**, **13.2 - What a Limit Does and Node-Pressure Eviction**, **13.3 - LimitRange, ResourceQuota and Storage Limits**, **13.4 - Metrics and the HorizontalPodAutoscaler** and **13.5 - In-Place Resize and the VerticalPodAutoscaler**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch13`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Write the requests and limits of a container, use the units for CPU and memory, and see which values the server rounds, takes and refuses
- Set a Pod-level budget, advertise an extended resource, and see a Pod wait for the slot until it is freed
- Watch a memory limit kill a container with `OOMKilled`, see a CPU limit throttle one, and read the three QoS classes
- Watch a node evict Pods under memory pressure, and read the order in which they go
- Give a namespace defaults and bounds with a LimitRange, and read the two refusals it makes
- Cap a namespace with a ResourceQuota, read its used counts, and find the Deployment that makes no Pods without an error
- Limit storage claims with a LimitRange and a quota, and see a `Pending` claim count
- Install metrics-server again, read `kubectl top`, and scale a Deployment under load with a HorizontalPodAutoscaler
- Read the conditions of an HPA and the metric types, and predict the decision for two metrics
- Resize a running Pod in place through the `resize` subresource, and read what the API server refuses
- Install the VerticalPodAutoscaler by hand, read its recommendation, and watch it evict Pods and resize them in place

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `burstable.yaml` | 13.1 › Requests, limits and the units › In practice (line 105) |  |
| `badunits.yaml` | 13.1 › Requests, limits and the units › In practice (line 164) |  |
| `reqgtlim.yaml` | 13.1 › Requests, limits and the units › In practice (line 223) |  |
| `podlevel.yaml` | 13.1 › Pod-level resources: one budget for the whole Pod › In practice (line 341) |  |
| `podbad.yaml` | 13.1 › Pod-level resources: one budget for the whole Pod › In practice (line 415) |  |
| `podguar.yaml` | 13.1 › Pod-level resources: one budget for the whole Pod › In practice (line 444) |  |
| `advertise.json` | 13.1 › Extended resources: a node resource of your own › Advertise one slot on the lab node (line 520) |  |
| `report-a.yaml` | 13.1 › Extended resources: a node resource of your own › Make two reports compete for the slot (line 547) |  |
| `report-b.yaml` | 13.1 › Extended resources: a node resource of your own › Make two reports compete for the slot (line 590) |  |
| `invalid-slot.yaml` | 13.1 › Extended resources: a node resource of your own › Distinguish API validation from a scheduling refusal (line 686) |  |
| `remove.json` | 13.1 › Extended resources: a node resource of your own › Remove only the owned advertisement (line 737) |  |
| `pods.yaml` | 13.2 › What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 70) |  |
| `oom.yaml` | 13.2 › What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 140) |  |
| `spin.yaml` | 13.2 › What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 212) |  |
| `evict-pods.yaml` | 13.2 › Node-pressure eviction: when the node itself runs short › In practice (line 324) |  |
| `late.yaml` | 13.2 › Node-pressure eviction: when the node itself runs short › In practice (line 445) |  |
| `lr.yaml` | 13.3 › LimitRange: defaults and bounds for a namespace › In practice (line 65) |  |
| `quota.yaml` | 13.3 › ResourceQuota: a ceiling for a namespace › In practice (line 200) |  |
| `storage.yaml` | 13.3 › Storage limits: LimitRange and ResourceQuota for claims › In practice (line 368) |  |
| `pvc.yaml` | 13.3 › Storage limits: LimitRange and ResourceQuota for claims › In practice (line 418) |  |
| `worker.sh` | 13.4 › metrics-server and the HorizontalPodAutoscaler › Observe a complete scaling cycle (line 119) |  |
| `worker.yaml` | 13.4 › metrics-server and the HorizontalPodAutoscaler › Observe a complete scaling cycle (line 142) |  |
| `resize.yaml` | 13.5 › In-place resize: new resources for a running Pod › In practice (line 73) |  |
| `kubebook-ch13-podctl-work/kind.yaml` | 13.5 › In-place resize: new resources for a running Pod › Resize the shared Pod budget (line 270) |  |
| `kubebook-ch13-podctl-work/pod.yaml` | 13.5 › In-place resize: new resources for a running Pod › Resize the shared Pod budget (line 293) |  |
| `certs/server.conf` | 13.5 › The VerticalPodAutoscaler › In practice (line 484) |  |
| `php-vpa.yaml` | 13.5 › The VerticalPodAutoscaler › In practice (line 569) |  |
| `vpa.yaml` | 13.5 › The VerticalPodAutoscaler › In practice (line 654) |  |
| `ex-bad.yaml` | 13.5 › Try it yourself (line 838) |  |
| `ex-lr.yaml` | 13.5 › Try it yourself (line 881) |  |
| `ex-grow.yaml` | 13.5 › Try it yourself (line 966) |  |
| `ex-small.yaml` | 13.5 › Try it yourself (line 1009) |  |
| `ex-budget.yaml` | 13.5 › Try it yourself (line 1065) |  |
| `ex-lr-st.yaml` | 13.5 › Try it yourself (line 1137) |  |
| `ex-pvc.yaml` | 13.5 › Try it yourself (line 1150) |  |
