# 46 - Kubernetes on AWS - EKS with Terraform, Auto Mode, Access Entries, Pod Identity and ECR

The files the chapter **46 - Kubernetes on AWS - EKS with Terraform, Auto Mode, Access Entries, Pod Identity and ECR** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch46`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Say what EKS Auto Mode runs for you, and what you still own: the network, the cluster settings, the workloads and who may use them
- Build an EKS cluster with Terraform from the published VPC and EKS modules, and read the cluster back
- Say why a node appears only when a Pod needs one; create a custom NodeClass and NodePool, then prove a Pod landed on their node
- Give a read-only role access with an access entry, and test what it may and may not do
- Push an image to ECR without leaving a sign-in behind, and run it on a node that Auto Mode adds
- Give a Pod an AWS role through EKS Pod Identity, and see that it can do only what its policy lists
- Reach the Pods through a Network Load Balancer and an Application Load Balancer, and say why the ALB name answers late
- Delete in the right order, so that no load balancer, VPC or role stays behind

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `terraform/eks/aws/provider.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 200) |  |
| `terraform/eks/aws/network.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 219) |  |
| `terraform/eks/aws/cluster.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 239) |  |
| `terraform/eks/aws/registry.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 265) |  |
| `terraform/eks/aws/access.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 301) |  |
| `terraform/eks/aws/outputs.tf` | Terraform for EKS: the VPC and EKS modules › In practice (line 334) |  |
| `app/index.html` | Images in ECR and a first workload › In practice (line 579) |  |
| `app/Dockerfile` | Images in ECR and a first workload › In practice (line 582) |  |
| `web.yaml` | Images in ECR and a first workload › In practice (line 623) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `course-storage.yaml` | A custom Auto Mode NodeClass and NodePool › The idea (line 726) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `course-pool.yaml` | A custom Auto Mode NodeClass and NodePool › The idea (line 742) |  |
| `course-placement.yaml` | A custom Auto Mode NodeClass and NodePool › The idea (line 799) |  |
| `who.yaml` | EKS Pod Identity: an AWS role for a ServiceAccount › In practice (line 1027) |  |
| `lb.yaml` | Load balancers on EKS, and leaving nothing behind › In practice (line 1113) |  |
| `alb.yaml` | Load balancers on EKS, and leaving nothing behind › In practice (line 1174) |  |
