# 16 - Claims, Classes and Dynamic Provisioning on kind; Access Modes, Static Provisioning, Binding and Release; ReadWriteOncePod and Local Volumes; StorageClass Fields, the Default Class and Volume Limits; CSI Snapshots, Clones and Resizing, and the Exercises

The files the chapter **16**, in its parts **16.1 - Claims, Classes and Dynamic Provisioning on kind**, **16.2 - Access Modes, Static Provisioning, Binding and Release**, **16.3 - ReadWriteOncePod and Local Volumes**, **16.4 - StorageClass Fields, the Default Class and Volume Limits** and **16.5 - CSI Snapshots, Clones and Resizing, and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch16`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Tell a PersistentVolume, a PersistentVolumeClaim and a StorageClass apart, and say who creates each one and where it lives
- Get storage with a claim, read how the default class and a provisioner make a volume, and find the files on the node
- Choose an access mode, and see why `ReadWriteOnce` means one node and not one Pod
- Make a volume by hand, bind a claim to it, and follow it through `Available`, `Bound` and `Released`
- Move a volume to `ReadWriteOncePod` without losing its data
- Use a `local` volume with a class that waits for the first Pod, and read the refusals that go with it
- Read the fields of a StorageClass, change the default class, and read the events of a claim that cannot bind
- Read a node's volume limit in `CSINode`, and the refusal `exceed max volume count`
- Use a CSI test driver to restore a snapshot, clone current data, and verify an API resize while checking the stored bytes
- Distinguish the practised CSI operations from populators, attribute changes, capacity tracking and raw block devices
- Run the eight exercises of the chapter and delete its cluster

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 16.1 › PersistentVolume, PersistentVolumeClaim and StorageClass › In practice (line 76) |  |
| `pvs.sh` | 16.1 › Dynamic provisioning on kind › In practice (line 190) |  |
| `pvcs.sh` | 16.1 › Dynamic provisioning on kind › In practice (line 199) |  |
| `dyn.yaml` | 16.1 › Dynamic provisioning on kind › In practice (line 204) |  |
| `user.yaml` | 16.1 › Dynamic provisioning on kind › In practice (line 245) |  |
| `db.yaml` | 16.1 › Dynamic provisioning on kind › In practice (line 365) |  |
| `why.sh` | 16.2 › Access modes and where a volume can be used › In practice (line 85) |  |
| `rwop.yaml` | 16.2 › Access modes and where a volume can be used › In practice (line 127) |  |
| `pv-a.yaml` | 16.2 › Static provisioning, binding and release › In practice (line 332) |  |
| `claim-a.yaml` | 16.2 › Static provisioning, binding and release › In practice (line 362) |  |
| `claim-named.yaml` | 16.2 › Static provisioning, binding and release › In practice (line 552) |  |
| `shared.yaml` | 16.3 › Moving a volume to ReadWriteOncePod › In practice (line 61) |  |
| `shared-rwop.yaml` | 16.3 › Moving a volume to ReadWriteOncePod › In practice (line 168) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `sc-local.yaml` | 16.3 › local volumes and WaitForFirstConsumer › In practice (line 262) |  |
| `pv-local.yaml` | 16.3 › local volumes and WaitForFirstConsumer › In practice (line 270) |  |
| `claim-local.yaml` | 16.3 › local volumes and WaitForFirstConsumer › In practice (line 307) |  |
| `userlocal.yaml` | 16.3 › local volumes and WaitForFirstConsumer › In practice (line 335) |  |
| `userbyname.yaml` | 16.3 › local volumes and WaitForFirstConsumer › In practice (line 410) |  |
| `sc-grow.yaml` | 16.4 › StorageClass fields and the default class › In practice (line 154) |  |
| `growclaim.yaml` | 16.4 › StorageClass fields and the default class › In practice (line 163) |  |
| `nosuch.yaml` | 16.4 › StorageClass fields and the default class › In practice (line 203) |  |
| `sc-fake.yaml` | 16.4 › StorageClass fields and the default class › In practice (line 310) |  |
| `claim-fake.yaml` | 16.4 › StorageClass fields and the default class › In practice (line 317) |  |
| `csidriver.yaml` | 16.4 › Volume limits per node › In practice (line 410) |  |
| `attach.yaml` | 16.4 › Volume limits per node › In practice (line 418) |  |
| `attach-pod.yaml` | 16.4 › Volume limits per node › In practice (line 447) |  |
| `restore.yaml` | 16.5 › What this chapter names and does not run › In practice (line 93) |  |
| `block.yaml` | 16.5 › What this chapter names and does not run › In practice (line 131) |  |
| `ch16-csi-work/kind.yaml` | 16.5 › A CSI snapshot, direct clone, and resize request in a separate kind cluster › Prepare the private lab (line 234) |  |
| `ch16-csi-work/source.yaml` | 16.5 › A CSI snapshot, direct clone, and resize request in a separate kind cluster › Write an exact baseline and make it snapshot-ready (line 264) |  |
| `ch16-csi-work/snapshot.yaml` | 16.5 › A CSI snapshot, direct clone, and resize request in a separate kind cluster › Write an exact baseline and make it snapshot-ready (line 314) |  |
| `ch16-csi-work/restore.yaml` | 16.5 › A CSI snapshot, direct clone, and resize request in a separate kind cluster › Restore the earlier bytes into a new claim (line 347) |  |
| `ch16-csi-work/clone.yaml` | 16.5 › A CSI snapshot, direct clone, and resize request in a separate kind cluster › Clone the current claim, then diverge the three histories (line 470) |  |
| `ex1.yaml` | 16.5 › Try it yourself (line 650) |  |
| `ex2.yaml` | 16.5 › Try it yourself (line 699) |  |
| `ex-pv.yaml` | 16.5 › Try it yourself (line 736) |  |
| `ex-claim-s.yaml` | 16.5 › Try it yourself (line 752) |  |
| `ex4.yaml` | 16.5 › Try it yourself (line 779) |  |
| `ex5.yaml` | 16.5 › Try it yourself (line 825) |  |
| `ex5-pod.yaml` | 16.5 › Try it yourself (line 844) |  |
| `ex6.yaml` | 16.5 › Try it yourself (line 878) |  |
| `ex7.yaml` | 16.5 › Try it yourself (line 951) |  |
| `ex7-pod.yaml` | 16.5 › Try it yourself (line 964) |  |
