#!/bin/sh
# hits.sh WORD COUNT: send COUNT requests to the web Service from the client Pod and count the answers that contain WORD
kubectl exec kubebook-ch17-client -- sh -c 'for i in $(seq 1 $0); do wget -qO- -T 3 http://kubebook-ch17-web; done' "$2" | grep -c "$1" || true
