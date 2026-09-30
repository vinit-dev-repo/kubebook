#!/bin/sh
# bump.sh DEPLOYMENT VERSION: change the version label and the VERSION variable of the Pod template
kubectl patch deployment "$1" --type=json -p '[{"op":"replace","path":"/spec/template/metadata/labels/version","value":"'"$2"'"},{"op":"replace","path":"/spec/template/spec/containers/0/env/0/value","value":"'"$2"'"}]' > /dev/null
