import ipaddress,json,subprocess,sys,uuid
from pathlib import Path
p=Path('source-ip')
def read(name):
    return json.loads((p/name).read_text())
def query(args):
    return json.loads(subprocess.check_output(args,text=True))
def address(value):
    assert ipaddress.ip_address(value).version==4
    return value
def initial():
    ns,pod,svc,node,client=read('namespace.json'),read('pod.json'),read('service.json'),read('node.json'),read('client.json')[0]
    assert ns['metadata']['name']=='kubebook-ch17-source-ip'
    assert pod['metadata']['name']=='source-receipt' and pod['metadata']['namespace']==ns['metadata']['name']
    assert pod['spec']['nodeName']==node['metadata']['name']=='kubebook-ch17-worker'
    assert any(c['type']=='Ready' and c['status']=='True' for c in pod['status']['conditions'])
    assert svc['metadata']['name']=='source-receipt' and svc['metadata']['namespace']==ns['metadata']['name']
    assert svc['spec']['type']=='NodePort' and svc['spec']['externalTrafficPolicy']=='Cluster'
    assert svc['spec']['selector']=={'app':'source-receipt'}
    endpoints=[e for s in read('endpoints.json')['items'] for e in s.get('endpoints',[])]
    assert len(endpoints)==1
    e=endpoints[0]
    assert e['conditions']['ready'] is True and e['nodeName']==pod['spec']['nodeName']
    assert e['targetRef']['uid']==pod['metadata']['uid'] and e['addresses']==[pod['status']['podIP']]
    assert client['Id']==(p/'client-id.txt').read_text().strip()
    assert client['Name']=='/kubebook-ch17-source-client' and client['State']['Running']
    assert client['Config']['Labels']['kubebook.owner']=='ch17-source-ip'
    assert set(client['NetworkSettings']['Networks'])=={'kind'}
    assert client['HostConfig']['NetworkMode']=='kind' and not client['Mounts']
    assert client['HostConfig']['ReadonlyRootfs'] and not client['HostConfig']['Privileged']
    client_ip=address(client['NetworkSettings']['Networks']['kind']['IPAddress'])
    node_ip=address(next(a['address'] for a in node['status']['addresses'] if a['type']=='InternalIP'))
    node_ips=[address(a['local']) for i in read('node-addresses.json') for a in i['addr_info'] if a['family']=='inet']
    assert node_ip in node_ips and client_ip not in node_ips
    port=svc['spec']['ports'][0]['nodePort']; assert 30000<=port<=32767
    state={'namespace_uid':ns['metadata']['uid'],'pod_uid':pod['metadata']['uid'],'service_uid':svc['metadata']['uid'],'node_uid':node['metadata']['uid'],'client_id':client['Id'],'client_ip':client_ip,'node_ip':node_ip,'node_ips':node_ips,'port':port,'ticket':uuid.uuid4().hex,'pod_ip':pod['status']['podIP'],'container_id':pod['status']['containerStatuses'][0]['containerID'],'restarts':pod['status']['containerStatuses'][0]['restartCount']}
    (p/'state.json').write_text(json.dumps(state,indent=2))
    print('One ready receipt endpoint on worker; external client has its own Docker address.')
def verify(phase='latest'):
    s=read('state.json')
    ns=query(['kubectl','get','namespace','kubebook-ch17-source-ip','-o','json'])
    pod=query(['kubectl','-n','kubebook-ch17-source-ip','get','pod','source-receipt','-o','json'])
    svc=query(['kubectl','-n','kubebook-ch17-source-ip','get','service','source-receipt','-o','json'])
    client=query(['docker','inspect','kubebook-ch17-source-client'])[0]
    node=query(['kubectl','get','node','kubebook-ch17-worker','-o','json'])
    interfaces=query(['docker','exec','kubebook-ch17-worker','ip','-j','-4','address','show'])
    node_ips=[address(a['local']) for i in interfaces for a in i['addr_info'] if a['family']=='inet']
    assert node['metadata']['uid']==s['node_uid']
    assert next(a['address'] for a in node['status']['addresses'] if a['type']=='InternalIP')==s['node_ip']
    assert sorted(node_ips)==sorted(s['node_ips'])
    assert ns['metadata']['uid']==s['namespace_uid'] and pod['metadata']['uid']==s['pod_uid'] and svc['metadata']['uid']==s['service_uid']
    assert pod['spec']['nodeName']=='kubebook-ch17-worker' and pod['status']['podIP']==s['pod_ip']
    status=pod['status']['containerStatuses'][0]
    assert status['ready'] and status['containerID']==s['container_id'] and status['restartCount']==s['restarts']
    assert client['Id']==s['client_id'] and client['Config']['Labels']['kubebook.owner']=='ch17-source-ip' and client['State']['Running']
    assert client['NetworkSettings']['Networks']['kind']['IPAddress']==s['client_ip']
    assert set(client['NetworkSettings']['Networks'])=={'kind'}
    assert svc['spec']['ports'][0]['nodePort']==s['port']
    endpoints=query(['kubectl','-n','kubebook-ch17-source-ip','get','endpointslice','-l','kubernetes.io/service-name=source-receipt','-o','json'])
    selected=[e for item in endpoints['items'] for e in item.get('endpoints',[])]
    assert len(selected)==1 and selected[0]['conditions']['ready'] is True
    assert selected[0]['targetRef']['uid']==s['pod_uid'] and selected[0]['nodeName']==pod['spec']['nodeName'] and selected[0]['addresses']==[s['pod_ip']]
    saved=p/'evidence'/phase
    saved.mkdir(parents=True,exist_ok=True)
    (saved/'records.json').write_text(json.dumps({'namespace':ns,'pod':pod,'service':svc,'client':client,'node':node,'interfaces':interfaces,'endpoints':endpoints},indent=2))
    (p/'latest-identity.json').write_text(json.dumps({'pod_uid':pod['metadata']['uid'],'service_uid':svc['metadata']['uid'],'client_id':client['Id'],'policy':svc['spec']['externalTrafficPolicy']},indent=2))
def observe(policy):
    verify('observed-'+policy.lower())
    s=read('state.json');r=read(policy.lower()+'/response.json')
    assert read('latest-identity.json')['policy']==policy
    assert r['pod']=='source-receipt' and r['uri']=='/receipt?ticket='+s['ticket']
    peer=address(r['peer'])
    if policy=='Cluster':
        assert read('latest-identity.json')['policy']=='Cluster'
        assert peer in s['node_ips'] and peer!=s['client_ip']
        print('Cluster: same worker endpoint; observed peer is an ingress-node address.')
    else:
        svc=read('local-service.json')
        assert svc['metadata']['uid']==s['service_uid'] and svc['spec']['externalTrafficPolicy']=='Local'
        assert peer==s['client_ip']
        print('Local: same worker endpoint; observed peer equals the external client address.')
action=sys.argv[1]
if action=='init': initial()
elif action=='verify': verify(sys.argv[2] if len(sys.argv)>2 else 'latest')
elif action=='observe': observe(sys.argv[2])
elif action=='field': print(read('state.json')[sys.argv[2]])
else: raise ValueError(action)
