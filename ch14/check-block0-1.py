import json
image=json.load(open('app-image.json'))[0]
assert any(x.endswith('@sha256:bdf57e528e45e4433820e045b29b4597825a1c9e38353532d90a01445013f82e') for x in image['RepoDigests'])
assert image['Architecture']=='amd64'
