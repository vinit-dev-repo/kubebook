#!/bin/sh
# usage: sh sched-on.sh CONFIGFILE
# copies the config into the node, adds its hostPath volume and the --config flag to the scheduler manifest, and waits
docker exec -i $CP sh -c 'cat > /etc/kubernetes/sched-config.yaml && chmod 600 /etc/kubernetes/sched-config.yaml' < "$1"
docker cp sched-mount.txt $CP:/root/sched-mount.txt
docker cp sched-volume.txt $CP:/root/sched-volume.txt
docker exec $CP sed -i -e '/^    volumeMounts:$/r /root/sched-mount.txt' -e '/^  volumes:$/r /root/sched-volume.txt' -e 's#    - --leader-elect=true#    - --leader-elect=true\n    - --config=/etc/kubernetes/sched-config.yaml#' /etc/kubernetes/manifests/kube-scheduler.yaml
sh wait-static.sh with sched-config kube-scheduler
