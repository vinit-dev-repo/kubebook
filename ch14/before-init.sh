set -eu
test -f /sys/fs/cgroup/cgroup.controllers
test -f /etc/systemd/system/kubelet.service
mv /etc/systemd/system/kubelet.service /opt/packaged-kubelet.service
ln -s /dev/null /etc/systemd/system/kubelet.service
mkdir -p /etc/systemd/system/containerd.service.d
printf '[Service]\nExecStartPre=\n' > /etc/systemd/system/containerd.service.d/standalone.conf
for service in systemd-modules-load.service systemd-sysctl.service; do
  test ! -e /etc/systemd/system/$service
  ln -s /dev/null /etc/systemd/system/$service
done
sed -i '/^\[plugins."io.containerd.grpc.v1.cri"\]$/a\  disable_apparmor = true' /etc/containerd/config.toml
exec /usr/local/bin/entrypoint /sbin/init
