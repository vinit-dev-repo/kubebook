# 37 - Authorization - RBAC, ClusterRoles and Service Accounts

The files the chapter **37 - Authorization - RBAC, ClusterRoles and Service Accounts** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch37`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `deployer.yaml` | Roles and RoleBindings › In practice (line 337) |  |
| `sar.json` | Roles and RoleBindings › In practice (line 428) |  |
| `agg.yaml` | ClusterRoles and ClusterRoleBindings › In practice (line 774) |  |
| `grantor.yaml` | Escalation prevention and good practice › In practice (line 891) |  |
| `impersonate.yaml` | Escalation prevention and good practice › In practice (line 952) |  |
| `approver.yaml` | Escalation prevention and good practice › In practice (line 998) |  |
| `lister.yaml` | ServiceAccounts and RBAC › In practice (line 1087) |  |
| `lister-nodes.yaml` | ServiceAccounts and RBAC › In practice (line 1119) |  |
| `automount.yaml` | ServiceAccounts and RBAC › In practice (line 1167) |  |
| `uses-secret.yaml` | The Node authorizer › In practice (line 1338) |  |
