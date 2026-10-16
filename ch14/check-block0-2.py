import json
from pathlib import Path
assert json.load(open('runtime-image.json'))['status']['id']==Path('app-config.id').read_text()
assert json.load(open('pause-image.json'))['status']['id']=='sha256:873ed75102791e5b0b8a7fcd41606c92fcec98d56d05ead4ac5131650004c136'
