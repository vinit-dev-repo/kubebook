from pathlib import Path
assert Path('kubelet-command.txt').read_text().splitlines()==['/usr/bin/kubelet','--config=/opt/kubebook/kubelet.yaml','--root-dir=/var/lib/kubebook-kubelet','--cert-dir=/var/lib/kubebook-kubelet/pki']
lines=Path('service-before.txt').read_text().splitlines()
assert 'Environment=' in lines and 'DropInPaths=' in lines
assert not any(s.startswith('EnvironmentFiles=') and s!='EnvironmentFiles=' for s in lines)
pid=next(s.split('=',1)[1] for s in lines if s.startswith('MainPID='))
assert int(pid)>0 and Path('kubelet-processes.txt').read_text().split()==[pid]
assert not {'KUBECONFIG','KUBERNETES_SERVICE_HOST','KUBERNETES_SERVICE_PORT'}.intersection(Path('kubelet-environment-keys.txt').read_text().splitlines())
