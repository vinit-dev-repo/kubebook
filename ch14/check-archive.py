import tarfile,json,hashlib
from pathlib import Path
with tarfile.open('app.tar') as archive:
    manifest=json.load(archive.extractfile('manifest.json'))
    assert len(manifest)==1
    config=archive.extractfile(manifest[0]['Config']).read()
    digest='sha256:'+hashlib.sha256(config).hexdigest()
    assert digest=='sha256:30ecbe1509090b38ef3260f3609d64d8261230464eaa4d235901db496e9647fb'
    Path('app-config.id').write_text(digest)
