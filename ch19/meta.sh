#!/bin/sh
# meta.sh URL: one request from the client Pod, printed as the answer and the exit code
kubectl exec -n kubebook-ch19-meta client -- sh -c "wget -qO- -T 3 $1 2>/dev/null; echo \"exit code \$?\""
