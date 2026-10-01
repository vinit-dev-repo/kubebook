# 40 - Node and Runtime Hardening - AppArmor, seccomp, gVisor and RuntimeClass

Files this chapter writes in its blocks, extracted byte for byte from the certified chapter. The chapter itself explains every line; read it in the tutorial. The blocks `cat` these files into a work folder `~/kubebook-ch40`; cloning this folder there gives the same result.

- `ping-pods.yaml`
- `seccomp-no-mkdir.yaml`
- `seccomp-missing.yaml`
- `aa-reject.yaml`
- `kind-aa.yaml`
- `aa-missing.yaml`
- `kubebook-deny-write.profile`
- `aa-deny.yaml`
- `aa-three.yaml`
- `userns.yaml`
- `userns-hostpath.yaml`
- `userns-hostnet.yaml`
- `gvisor-pods.yaml`
- `sandboxed-seccomp.yaml`
- `rc-missing.yaml`
- `rc-absent.yaml`
- `no-chmod.yaml`
- `restricted-ping.yaml`
- `gvisor-node.sh`
- `gvisor-ex.yaml`
- `userns-ex.yaml`
