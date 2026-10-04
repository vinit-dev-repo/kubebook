# kubebook

The files the chapters of the **Kubernetes tutorial** (the LearnAIConcepts programme) write in their command blocks, one folder per chapter, extracted byte for byte from each certified chapter. Nothing here is meant to run on its own: read the chapter, which explains every line. Cloning a chapter's folder into the work folder the chapter names (`~/kubebook-chNN`) gives the same files the chapter's blocks would have typed.

## What the tutorial covers

The tutorial is one book in nine parts and 48 chapters. Every command in it was run, in order, on two machines: Docker Desktop's kind on Windows and a plain Docker Engine's kind on Ubuntu, with kind v0.33.0, Kubernetes v1.36.4, kubectl v1.36.4, Helm v4.3.0 and Kustomize v5.8.1. Every chapter creates its own throwaway cluster named `kubebook-chNN` and deletes it at the end. The three cloud chapters build real clusters on Google Cloud, AWS and Azure and delete them too.

| Folder | Chapter | What it teaches |
|---|---|---|
| `ch01` | What Kubernetes Is | Container orchestration, the cluster and its parts |
| `ch02` | The Book's Lab | kind on Windows and Linux, kubectl, kubeconfig and contexts |
| `ch03` | First Steps with kubectl | A Pod, a Deployment and a Service, imperatively |
| `ch04` | Manifests and the Kubernetes API | YAML, apiVersion and kind, apply, explain and Events |
| `ch05` | Pods in Depth | Commands and arguments, multi-container Pods, init containers and sidecars |
| `ch06` | The Pod Lifecycle | Restart policies, probes, logs and debugging |
| `ch07` | Organizing Objects | Labels, selectors, annotations and namespaces |
| `ch08` | Configuration | Environment variables, ConfigMaps and Secrets |
| `ch09` | ReplicaSets and Deployments | Scaling, rolling updates, rollbacks and self-healing |
| `ch10` | Deployment Strategies | Recreate, blue-green and canary |
| `ch11` | StatefulSets | Stable names, ordered Pods and their own storage |
| `ch12` | DaemonSets, Jobs and CronJobs | One Pod per node; run-to-completion and scheduled work |
| `ch13` | Resources and Autoscaling | Requests, limits, quotas, LimitRanges, HPA, VPA and in-place resize |
| `ch14` | Scheduling | Node selectors, affinity, taints and tolerations, priority, static Pods and multiple schedulers |
| `ch15` | Volumes | emptyDir, hostPath, ConfigMap, Secret, projected and Downward API volumes |
| `ch16` | Persistent Storage | PersistentVolumes, claims, access modes, StorageClasses and CSI |
| `ch17` | Services and DNS | ClusterIP, NodePort, LoadBalancer, headless Services and discovery |
| `ch18` | Ingress and the Gateway API | Routes, TLS and rewrites |
| `ch19` | Network Policies | Who may talk to whom |
| `ch20` | Several Deployments Together | Two web apps behind Nginx, and the voting app |
| `ch21` | A Multi-Container Application on Kubernetes | A worker, Postgres, Redis, a React client and Ingress |
| `ch22` | A Java Stack on Kubernetes | Tomcat, MySQL, Memcached, RabbitMQ, Secrets, volumes and Ingress |
| `ch23` | Helm | Repositories, releases, values, upgrades and rollbacks |
| `ch24` | Writing Helm Charts | Structure, built-in objects, functions, flow control, variables and named templates |
| `ch25` | Helm Dependencies | Sub-charts, aliases, conditions, tags, global and imported values, and starter charts |
| `ch26` | Helm Lifecycle and Distribution | Hooks, tests, resource policy, plugins, signing, repositories, OCI and schema validation |
| `ch27` | Kustomize | Bases, overlays, transformers, patches and components |
| `ch28` | The Developer Loop | Skaffold, the Dashboard and Lens |
| `ch29` | The Control Plane Up Close | etcd, the API server, the controller manager, the scheduler, the kubelet and kube-proxy |
| `ch30` | Container Runtimes | containerd, the CRI, crictl and CRI-O |
| `ch31` | Cluster Networking | CNI, Pod and Service networking, and CoreDNS |
| `ch32` | Building a Cluster with kubeadm | Design, high availability, upgrades and node maintenance, on three clouds |
| `ch33` | Backup, Restore and Monitoring | etcd snapshots, the metrics server and cluster logs |
| `ch34` | Troubleshooting | Applications, the control plane, worker nodes and the network, with JSONPath |
| `ch35` | Extending Kubernetes | Custom resources, controllers, operators, admission controllers and API versions |
| `ch36` | Authentication | TLS and certificates, the Certificates API, kubeconfig and users |
| `ch37` | Authorization | RBAC, ClusterRoles and service accounts |
| `ch38` | Workload Security | Security contexts, capabilities, Pod Security Standards, image security and Secrets at rest |
| `ch39` | Cluster Hardening | CIS benchmarks, the API server, etcd and the kubelet, auditing and verified binaries |
| `ch40` | Node and Runtime Hardening | AppArmor, seccomp, gVisor and RuntimeClass |
| `ch41` | Supply Chain Security | Image scanning, static analysis, SBOMs and the Docker daemon |
| `ch42` | Runtime Security | Falco, Sysdig and audit logs |
| `ch43` | Cilium and a Service Mesh | Cilium network policies, transparent encryption and Istio mutual TLS |
| `ch44` | From Laptop to Production | Choosing a cluster, load balancers, and HTTPS with cert-manager |
| `ch45` | Kubernetes on Google Cloud | GKE Autopilot, a deployment workflow and HTTPS |
| `ch46` | Kubernetes on AWS | EKS with Terraform, Auto Mode, access entries, Pod Identity and ECR |
| `ch47` | Kubernetes on Azure | AKS, ACR and Workload Identity |
| (none) | The Exam View | The CKA, CKAD and CKS syllabus, linked to the chapters; it writes no files |

## How the folders are made

Each chapter writes its files with `cat > FILE <<'EOF' ... EOF` blocks. A tool reads the certified chapter and copies every such file here, under the chapter's folder, keeping the sub-folders the chapter's `cd` lines imply. Every folder has its own `README.md` listing its files. Nothing is hand-edited here; when a chapter changes, its folder is regenerated.

## Names, tags and clean-up

Everything the chapters create is named `kubebook-chNN-...`: the kind cluster, the namespaces made by hand, the Helm releases, the image tags and the cloud resources, which also carry the tag `kubebook=kubebook-chNN`. A chapter's last block deletes what it made and prints `0` as the count of what is left.
