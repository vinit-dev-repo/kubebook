#!/bin/sh
# try.sh NAME NAMESPACE TARGET: one request from the Pod NAME, printed as one line
r=$(kubectl exec -n "$2" "$1" -- sh -c "wget -qO- -T 3 http://$3 > /dev/null 2>&1 && echo ok || echo blocked")
echo "$1 ($2) -> $3: $r"
