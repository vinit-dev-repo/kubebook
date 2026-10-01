#!/bin/sh
log=/var/log/kubernetes/audit/audit.log
for i in $(seq 1 30); do grep -q '"name":"a2"' $log && break; sleep 1; done
echo "log file mode: $(stat -c %a $log)"
echo "--- the Secret s1"
grep '"name":"s1"' $log | jq -c 'select(.user.username == "kubernetes-admin") | {level, verb, user: .user.username, resource: .objectRef.resource, ns: .objectRef.namespace, code: .responseStatus.code}'
echo "the made-up value inside the log: $(grep -c kubebook-not-a-real-one-1 $log || true)"
echo "--- the Pod a1"
grep '"name":"a1"' $log | jq -c 'select(.user.username == "kubernetes-admin") | {level, verb, stage, user: .user.username, hasReq: (.requestObject != null), hasResp: (.responseObject != null)}'
echo "--- the Pod a2, in a namespace with the audit label"
grep '"name":"a2"' $log | jq -r 'select(.verb == "create" and .user.username == "kubernetes-admin") | .annotations["pod-security.kubernetes.io/audit-violations"]' | sed -E 's/^(would violate PodSecurity "[^"]*").*/\1/'
grep '"name":"a2"' $log | jq -r 'select(.verb == "create" and .user.username == "kubernetes-admin") | .annotations["authorization.k8s.io/decision"], .annotations["authorization.k8s.io/reason"]'
echo "--- the whole log"
jq -r .level $log | LC_ALL=C sort -u
echo "event lines about events: $(grep -c '"resource":"events"' $log || true)"
awk 'NR == 1' $log | jq -r 'keys | join(" ")'
