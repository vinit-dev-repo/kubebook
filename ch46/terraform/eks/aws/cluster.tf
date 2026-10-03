module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.26.0"

  name                                     = var.key
  kubernetes_version                       = "1.36"
  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true
  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  create_kms_key    = false
  encryption_config = null
}
