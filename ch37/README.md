# 37 - Authorization Modes, Roles, RoleBindings and Subresources; ClusterRoles, Escalation Prevention, ServiceAccounts and the Node Authorizer

The files the chapter **37**, in its parts **37.1 - Authorization Modes, Roles, RoleBindings and Subresources** and **37.2 - ClusterRoles, Escalation Prevention, ServiceAccounts and the Node Authorizer**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch37`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say how the API server asks each authorization mode in turn, and why the first verdict ends the check
- Write a Role and a RoleBinding, give them to a user, a group and a ServiceAccount, and test them with `kubectl auth can-i`
- Name a subresource such as `pods/log`, and a single object, in a rule, and see why `exec` needs a rule of its own
- Use a ClusterRole for the whole cluster and, through a RoleBinding, for one namespace, and add rules to it with aggregation
- Read the default roles `view`, `edit`, `admin` and `cluster-admin`, and say what each one may do
- Explain why a user may grant only the rights that the user holds, and what the verbs `escalate`, `bind` and `impersonate` change
- Give a Pod an identity with a ServiceAccount, call the API from the Pod, and switch the token off with `automountServiceAccountToken`
- Say what the Node authorizer lets a kubelet read, and why it stops there

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `deployer.yaml` | 37.1 › Roles and RoleBindings › In practice (line 341) |  |
| `sar.json` | 37.1 › Roles and RoleBindings › In practice (line 430) |  |
| `agg.yaml` | 37.2 › ClusterRoles and ClusterRoleBindings › In practice (line 262) |  |
| `grantor.yaml` | 37.2 › Escalation prevention and good practice › In practice (line 396) |  |
| `impersonate.yaml` | 37.2 › Escalation prevention and good practice › In practice (line 459) |  |
| `approver.yaml` | 37.2 › Escalation prevention and good practice › In practice (line 509) |  |
| `lister.yaml` | 37.2 › ServiceAccounts and RBAC › In practice (line 615) |  |
| `lister-nodes.yaml` | 37.2 › ServiceAccounts and RBAC › In practice (line 646) |  |
| `automount.yaml` | 37.2 › ServiceAccounts and RBAC › In practice (line 694) |  |
| `uses-secret.yaml` | 37.2 › The Node authorizer › In practice (line 876) |  |
