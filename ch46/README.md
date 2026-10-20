# 46 - EKS Auto Mode and a Cluster Built with Terraform; Access Entries, Images in ECR and a Custom NodePool; An EBS Attachment, Pod Identity, Load Balancers and the Cleanup

The files the chapter **46**, in its parts **46.1 - EKS Auto Mode and a Cluster Built with Terraform**, **46.2 - Access Entries, Images in ECR and a Custom NodePool** and **46.3 - An EBS Attachment, Pod Identity, Load Balancers and the Cleanup**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch46`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say what EKS Auto Mode runs for you, and what you still own: the network, the cluster settings, the workloads and who may use them
- Build an EKS cluster with Terraform from the published VPC and EKS modules, and read the cluster back
- Say why a node appears only when a Pod needs one, and read the built-in NodePool and NodeClass
- Give a read-only role access with an access entry, and test what it may and may not do
- Push an image to ECR without leaving a sign-in behind, and run it on a node that Auto Mode adds
- Create a custom NodeClass and NodePool, then prove with the Node and the NodeClaim that a Pod landed on their node
- Show with a real EBS disk that ReadWriteOnce means one node, and follow three IDs from the event to the disk
- Give a Pod an AWS role through EKS Pod Identity, and see that it can do only what its policy lists
- Reach the Pods through a Network Load Balancer and an Application Load Balancer, and say why the ALB name answers late
- Delete in the right order, so that no load balancer, VPC or role stays behind

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `terraform/eks/aws/provider.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 208) |  |
| `terraform/eks/aws/network.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 226) |  |
| `terraform/eks/aws/cluster.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 245) |  |
| `terraform/eks/aws/registry.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 270) |  |
| `terraform/eks/aws/access.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 305) |  |
| `terraform/eks/aws/outputs.tf` | 46.1 › Terraform for EKS: the VPC and EKS modules › In practice (line 338) |  |
| `app/index.html` | 46.2 › Images in ECR and a first workload › In practice (line 196) |  |
| `app/Dockerfile` | 46.2 › Images in ECR and a first workload › In practice (line 199) |  |
| `web.yaml` | 46.2 › Images in ECR and a first workload › In practice (line 237) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `course-storage.yaml` | 46.2 › A custom Auto Mode NodeClass and NodePool › The idea (line 356) | a template: the shell fills in $VARIABLES when the chapter runs it |
| `course-pool.yaml` | 46.2 › A custom Auto Mode NodeClass and NodePool › The idea (line 372) |  |
| `course-placement.yaml` | 46.2 › A custom Auto Mode NodeClass and NodePool › The idea (line 430) |  |
| `who.yaml` | 46.3 › EKS Pod Identity: an AWS role for a ServiceAccount › In practice (line 165) |  |
| `lb.yaml` | 46.3 › Load balancers on EKS, and leaving nothing behind › In practice (line 262) |  |
| `alb.yaml` | 46.3 › Load balancers on EKS, and leaving nothing behind › In practice (line 321) |  |
