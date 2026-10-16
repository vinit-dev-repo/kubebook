import json
from pathlib import Path
read=lambda name:json.loads(Path(name).read_text())[0]
owner=Path('owner.marker').read_text().strip()
node=read('node-final.json');net=read('network-final.json');volume=read('volume-final.json')
assert node['Id']==Path('container.id').read_text().strip()
assert node['Name']=='/'+owner and node['Config']['Labels']['kubebook.owner']==owner
assert node['Image']==read('node-image.json')['Id']
assert node['HostConfig']['CgroupnsMode']=='private' and not node['HostConfig']['PortBindings']
assert node['HostConfig']['Privileged'] and node['HostConfig']['NetworkMode']==owner+'-net'
assert set(node['NetworkSettings']['Networks'])=={owner+'-net'}
assert net['Id']==Path('network.id').read_text().strip() and net['Internal']
assert net['Labels']['kubebook.owner']==owner and set(net['Containers'])=={node['Id']}
assert volume['Name']==owner+'-var' and volume['Labels']['kubebook.owner']==owner
assert volume==read('volume-created.json')
mounts=node['Mounts'];assert len(mounts)==1 and mounts[0]['Type']=='volume'
assert mounts[0]['Name']==volume['Name'] and mounts[0]['Destination']=='/var'
assert Path('volume-users.txt').read_text().splitlines()==[node['Id']]
