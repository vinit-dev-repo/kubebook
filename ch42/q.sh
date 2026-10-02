#!/bin/sh
L=/var/log/kubernetes/audit/audit.log
echo "log file mode: $(stat -c %a $L)"
echo "--- who deleted the Secret s1"
jq -c 'select(.objectRef.resource == "secrets" and .objectRef.name == "s1" and .verb == "delete") | {user: .user.username, ns: .objectRef.namespace, code: .responseStatus.code, stage}' $L
echo "--- which requests were refused in this namespace, and for whom"
jq -c 'select(.responseStatus.code == 403 and .objectRef.namespace == "kubebook-ch42-audit") | {user: .user.username, as: .impersonatedUser.username, verb, resource: .objectRef.resource, reason: .annotations["authorization.k8s.io/decision"]}' $L
echo "--- who ran exec, and with which command"
jq -c 'select(.objectRef.subresource == "exec") | {user: .user.username, pod: .objectRef.name, ns: .objectRef.namespace, level, stage, uri: .requestURI}' $L
echo "--- who created a ClusterRoleBinding"
jq -c 'select(.objectRef.resource == "clusterrolebindings" and .verb == "create") | {user: .user.username, name: .objectRef.name, role: .requestObject.roleRef.name, subjects: [.requestObject.subjects[].name], level}' $L
echo "--- the keys of an exec event"
jq -r 'select(.objectRef.subresource == "exec") | keys | join(" ")' $L | awk 'NR == 1'
