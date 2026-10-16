import json,sys
from pathlib import Path
def read(name):
    return json.loads(Path(name).read_text(encoding='utf-8'))
def gated(pod):
    assert pod['spec'].get('schedulingGates')==[{'name':'training.example/hold'}], 'gate missing'
    assert not pod['spec'].get('nodeName'), 'Pod scheduled'
    assert not any(s.get('containerID') for s in pod.get('status',{}).get('containerStatuses',[])), 'container started'
    assert pod['metadata'].get('uid'), 'not a stored Pod'
def event(events,namespace,name,violation):
    matches=[e for e in events if e.get('stage')=='ResponseComplete' and e.get('verb')=='create'
             and e.get('objectRef',{}).get('resource')=='pods'
             and e['objectRef'].get('namespace')==namespace and e['objectRef'].get('name')==name]
    assert len(matches)==1, 'need exactly one correlated completion event'
    e=matches[0]
    assert e['responseStatus']['code']==201, 'create did not succeed'
    assert 'dryRun' not in e['requestURI'], 'not a stored creation'
    annotation=e.get('annotations',{}).get('pod-security.kubernetes.io/audit-violations','')
    assert bool(annotation)==violation, 'unexpected violation annotation'
    if violation: assert 'restricted:v1.36' in annotation
    return e
if __name__=='__main__':
    mode=sys.argv[1]
    if mode=='gated': gated(read(sys.argv[2]))
    elif mode=='event':
        events=[json.loads(line) for line in Path('audit.jsonl').read_text().splitlines() if line.strip()]
        result=event(events,sys.argv[2],sys.argv[3],sys.argv[4]=='violation')
        Path(sys.argv[3]+'-audit.json').write_text(json.dumps(result,indent=2))
    else: raise AssertionError('unknown inspection mode')
