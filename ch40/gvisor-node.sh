#!/usr/bin/env bash
set -e
NODE=$1
docker cp gvisor/runsc $NODE:/usr/local/bin/runsc > /dev/null
docker cp gvisor/containerd-shim-runsc-v1 $NODE:/usr/local/bin/containerd-shim-runsc-v1 > /dev/null
docker cp gvisor/gvisor-bin $NODE:/usr/local/bin/gvisor-bin > /dev/null
docker exec $NODE sh -c 'chmod 755 /usr/local/bin/runsc /usr/local/bin/containerd-shim-runsc-v1 /usr/local/bin/gvisor-bin/*'
docker exec $NODE sh -c "printf '\n[plugins.\"io.containerd.grpc.v1.cri\".containerd.runtimes.runsc]\n  runtime_type = \"io.containerd.runsc.v1\"\n' >> /etc/containerd/config.toml; systemctl restart containerd"
