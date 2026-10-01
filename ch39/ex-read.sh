#!/bin/sh
log=/var/log/kubernetes/audit/audit.log
for i in $(seq 1 30); do grep -q '"name":"ex-cm"' $log && break; sleep 1; done
grep '"name":"ex-cm"' $log | jq -c 'select(.verb == "create") | {level, verb, hasReq: (.requestObject != null), hasResp: (.responseObject != null)}'
echo "Secret events in the log: $(grep -c '"resource":"secrets"' $log || true)"
