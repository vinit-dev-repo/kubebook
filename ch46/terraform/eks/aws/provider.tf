terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.0" }
  }
}
variable "key" { type = string }
provider "aws" {
  region = "us-east-1"
  default_tags { tags = { kubebook = var.key } }
}
