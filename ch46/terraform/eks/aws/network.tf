module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name                    = var.key
  cidr                    = "10.46.0.0/16"
  azs                     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets          = ["10.46.1.0/24", "10.46.2.0/24", "10.46.3.0/24"]
  map_public_ip_on_launch = true
  enable_nat_gateway      = false
  public_subnet_tags      = { "kubernetes.io/role/elb" = "1" }
}
