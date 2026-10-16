# 16 - Persistent Storage - PersistentVolumes, Claims, Access Modes, StorageClasses and CSI

The files the chapter **16 - Persistent Storage - PersistentVolumes, Claims, Access Modes, StorageClasses and CSI** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch16`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Tell a PersistentVolume, a PersistentVolumeClaim and a StorageClass apart, and say who creates each one and where it lives
- Get storage with a claim, read how the default class and a provisioner make a volume, and find the files on the node
- Choose an access mode, and see why `ReadWriteOnce` means one node and not one Pod
- Make a volume by hand, bind a claim to it, and follow it through `Available`, `Bound` and `Released`
- Use a `local` volume with a class that waits for the first Pod, and read the refusals that go with it
- Read the fields of a StorageClass, change the default class, and read the events of a claim that cannot bind
- Use a CSI test driver to restore a snapshot, clone current data, and verify an API resize while checking the stored bytes
- Distinguish the practised CSI operations from populators, attribute changes, capacity tracking and raw block devices
- Move a volume to `ReadWriteOncePod` without losing its data
- Read a node's volume limit in `CSINode`, and the refusal `exceed max volume count`

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | PersistentVolume, PersistentVolumeClaim and StorageClass › In practice (line 83) |  |
| `pvs.sh` | Dynamic provisioning on kind › In practice (line 184) |  |
| `pvcs.sh` | Dynamic provisioning on kind › In practice (line 193) |  |
| `dyn.yaml` | Dynamic provisioning on kind › In practice (line 198) |  |
| `user.yaml` | Dynamic provisioning on kind › In practice (line 239) |  |
| `db.yaml` | Dynamic provisioning on kind › In practice (line 357) |  |
| `why.sh` | Access modes and where a volume can be used › In practice (line 475) |  |
| `rwop.yaml` | Access modes and where a volume can be used › In practice (line 517) |  |
| `pv-a.yaml` | Static provisioning, binding and release › In practice (line 696) |  |
| `claim-a.yaml` | Static provisioning, binding and release › In practice (line 727) |  |
| `claim-named.yaml` | Static provisioning, binding and release › In practice (line 915) |  |
| `shared.yaml` | Moving a volume to ReadWriteOncePod › In practice (line 962) |  |
| `shared-rwop.yaml` | Moving a volume to ReadWriteOncePod › In practice (line 1072) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `sc-local.yaml` | local volumes and WaitForFirstConsumer › In practice (line 1158) |  |
| `pv-local.yaml` | local volumes and WaitForFirstConsumer › In practice (line 1166) |  |
| `claim-local.yaml` | local volumes and WaitForFirstConsumer › In practice (line 1204) |  |
| `userlocal.yaml` | local volumes and WaitForFirstConsumer › In practice (line 1233) |  |
| `userbyname.yaml` | local volumes and WaitForFirstConsumer › In practice (line 1306) |  |
| `sc-grow.yaml` | StorageClass fields and the default class › In practice (line 1448) |  |
| `growclaim.yaml` | StorageClass fields and the default class › In practice (line 1457) |  |
| `nosuch.yaml` | StorageClass fields and the default class › In practice (line 1496) |  |
| `sc-fake.yaml` | StorageClass fields and the default class › In practice (line 1601) |  |
| `claim-fake.yaml` | StorageClass fields and the default class › In practice (line 1608) |  |
| `csidriver.yaml` | Volume limits per node › In practice (line 1699) |  |
| `attach.yaml` | Volume limits per node › In practice (line 1707) |  |
| `attach-pod.yaml` | Volume limits per node › In practice (line 1736) |  |
| `restore.yaml` | What this chapter names and does not run › In practice (line 1870) |  |
| `block.yaml` | What this chapter names and does not run › In practice (line 1908) |  |
| `ch16-csi-work/kind.yaml` | A CSI snapshot, direct clone, and resize request in a separate kind cluster › Prepare the private lab (line 2003) |  |
| `ch16-csi-work/source.yaml` | A CSI snapshot, direct clone, and resize request in a separate kind cluster › Write an exact baseline and make it snapshot-ready (line 2033) |  |
| `ch16-csi-work/snapshot.yaml` | A CSI snapshot, direct clone, and resize request in a separate kind cluster › Write an exact baseline and make it snapshot-ready (line 2084) |  |
| `ch16-csi-work/restore.yaml` | A CSI snapshot, direct clone, and resize request in a separate kind cluster › Restore the earlier bytes into a new claim (line 2119) |  |
| `ch16-csi-work/clone.yaml` | A CSI snapshot, direct clone, and resize request in a separate kind cluster › Clone the current claim, then diverge the three histories (line 2241) |  |
| `ex1.yaml` | Try it yourself (line 2430) |  |
| `ex2.yaml` | Try it yourself (line 2479) |  |
| `ex-pv.yaml` | Try it yourself (line 2516) |  |
| `ex-claim-s.yaml` | Try it yourself (line 2532) |  |
| `ex4.yaml` | Try it yourself (line 2559) |  |
| `ex5.yaml` | Try it yourself (line 2605) |  |
| `ex5-pod.yaml` | Try it yourself (line 2624) |  |
| `ex6.yaml` | Try it yourself (line 2658) |  |
| `ex7.yaml` | Try it yourself (line 2731) |  |
| `ex7-pod.yaml` | Try it yourself (line 2744) |  |
