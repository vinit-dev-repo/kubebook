# 13 - Resources and Autoscaling - Requests, Limits, Quotas, LimitRanges, HPA, VPA and In-Place Resize

The files the chapter **13 - Resources and Autoscaling - Requests, Limits, Quotas, LimitRanges, HPA, VPA and In-Place Resize** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch13`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Write the requests and limits of a container, use the units for CPU and memory, and see which values the server rounds, takes and refuses
- Watch a memory limit kill a container with `OOMKilled`, see a CPU limit throttle one, and read the three QoS classes
- Give a namespace defaults and bounds with a LimitRange, and read the two refusals it makes
- Cap a namespace with a ResourceQuota, read its used counts, and find the Deployment that makes no Pods without an error
- Install metrics-server again, read `kubectl top`, and scale a Deployment under load with a HorizontalPodAutoscaler
- Resize a running Pod in place through the `resize` subresource, and read what the API server refuses
- Install the VerticalPodAutoscaler by hand, read its recommendation, and watch it evict Pods and resize them in place
- Set a Pod-level budget, advertise an extended resource, watch a node evict Pods under pressure, and limit storage claims

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `burstable.yaml` | Requests, limits and the units › In practice (line 106) |  |
| `badunits.yaml` | Requests, limits and the units › In practice (line 166) |  |
| `reqgtlim.yaml` | Requests, limits and the units › In practice (line 226) |  |
| `podlevel.yaml` | Pod-level resources: one budget for the whole Pod › In practice (line 336) |  |
| `podbad.yaml` | Pod-level resources: one budget for the whole Pod › In practice (line 410) |  |
| `podguar.yaml` | Pod-level resources: one budget for the whole Pod › In practice (line 440) |  |
| `advertise.json` | Extended resources: a node resource of your own › Advertise one slot on the lab node (line 513) |  |
| `report-a.yaml` | Extended resources: a node resource of your own › Make two reports compete for the slot (line 542) |  |
| `report-b.yaml` | Extended resources: a node resource of your own › Make two reports compete for the slot (line 585) |  |
| `invalid-slot.yaml` | Extended resources: a node resource of your own › Distinguish API validation from a scheduling refusal (line 685) |  |
| `remove.json` | Extended resources: a node resource of your own › Remove only the owned advertisement (line 738) |  |
| `pods.yaml` | What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 793) |  |
| `oom.yaml` | What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 863) |  |
| `spin.yaml` | What a limit does: OOMKilled, throttling and the QoS classes › In practice (line 933) |  |
| `evict-pods.yaml` | Node-pressure eviction: when the node itself runs short › In practice (line 1040) |  |
| `late.yaml` | Node-pressure eviction: when the node itself runs short › In practice (line 1161) |  |
| `lr.yaml` | LimitRange: defaults and bounds for a namespace › In practice (line 1219) |  |
| `quota.yaml` | ResourceQuota: a ceiling for a namespace › In practice (line 1344) |  |
| `storage.yaml` | Storage limits: LimitRange and ResourceQuota for claims › In practice (line 1507) |  |
| `pvc.yaml` | Storage limits: LimitRange and ResourceQuota for claims › In practice (line 1558) |  |
| `worker.sh` | metrics-server and the HorizontalPodAutoscaler › Observe a complete scaling cycle (line 1720) |  |
| `worker.yaml` | metrics-server and the HorizontalPodAutoscaler › Observe a complete scaling cycle (line 1743) |  |
| `resize.yaml` | In-place resize: new resources for a running Pod › In practice (line 2009) |  |
| `kubebook-ch13-podctl-work/kind.yaml` | In-place resize: new resources for a running Pod › Resize the shared Pod budget (line 2203) |  |
| `kubebook-ch13-podctl-work/pod.yaml` | In-place resize: new resources for a running Pod › Resize the shared Pod budget (line 2227) |  |
| `certs/server.conf` | The VerticalPodAutoscaler › In practice (line 2398) |  |
| `php-vpa.yaml` | The VerticalPodAutoscaler › In practice (line 2483) |  |
| `vpa.yaml` | The VerticalPodAutoscaler › In practice (line 2567) |  |
| `ex-bad.yaml` | Try it yourself (line 2758) |  |
| `ex-lr.yaml` | Try it yourself (line 2801) |  |
| `ex-grow.yaml` | Try it yourself (line 2886) |  |
| `ex-small.yaml` | Try it yourself (line 2929) |  |
| `ex-budget.yaml` | Try it yourself (line 2985) |  |
| `ex-lr-st.yaml` | Try it yourself (line 3057) |  |
| `ex-pvc.yaml` | Try it yourself (line 3070) |  |
