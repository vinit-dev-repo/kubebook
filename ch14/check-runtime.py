import json,sys
from pathlib import Path
mode=sys.argv[1]
podname='ridge-receipt-kubebook-ch14-standalone'
read=lambda name:json.loads(Path(name).read_text())
if mode=='before':
    pods=read('pods-before.json')['items']
    assert len(pods)==1
    pod=pods[0]
    assert pod['metadata']['name']==podname and pod['metadata']['namespace']=='default'
    assert pod['state']=='SANDBOX_READY' and pod['annotations']['kubernetes.io/config.source']=='file'
    containers=read('containers-before.json')['containers'];assert len(containers)==1
    container=containers[0]
    assert container['state']=='CONTAINER_RUNNING' and container['metadata']['name']=='receipt'
    assert container['podSandboxId']==pod['id']
    assert container['labels']['io.kubernetes.pod.name']==podname
    assert container['labels']['io.kubernetes.pod.uid']==pod['metadata']['uid']
    assert container['imageRef']==Path('app-config.id').read_text()
    Path('workload-identity.json').write_text(json.dumps({'container':container['id'],'sandbox':pod['id'],'pod_uid':pod['metadata']['uid']}))
else:
    assert mode=='after'
    containers=read('containers-after.json')['containers']
    original=read('workload-identity.json')['container']
    for container in containers:
        assert container['labels']['io.kubernetes.pod.name']==podname
        assert container['metadata']['name']=='receipt'
        if container['state']=='CONTAINER_RUNNING':sys.exit(3)
    assert not any(c['id']==original and c['state']=='CONTAINER_RUNNING' for c in containers)
