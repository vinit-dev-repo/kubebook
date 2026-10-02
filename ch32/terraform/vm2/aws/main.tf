# TARGET vm2 / AWS: two Ubuntu 24.04 EC2 instances (<prefix>-cp and <prefix>-worker, t3.medium, 2 vCPU / 4 GB, 30 GB gp3)
# in the default VPC, both in us-east-1a, in ONE security group that allows all traffic between its members (the rule
# names the group itself), SSH (22) from the world, the API server (6443) from the world only when api_from_world is
# true, and all egress. source_dest_check is off on both (a CNI may route pod traffic through a node).
# The OS is stock Ubuntu: cloud-init installs only the SSH host key (generated here, one per machine, printed by the
# cp_host_key and worker_host_key outputs; a chapter builds its known_hosts line from them, never from ssh-keyscan).
# Cost: about 2 x $0.042/hour while it stands; the chapter destroys it the same session.
terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.0" }
    tls = { source = "hashicorp/tls", version = "~> 4.0" }
  }
}

variable "key" {
  description = "The book's key for this run (chNN for a chapter); every resource is tagged kubebook=<key> and named kubebook-<key>-..."
  type        = string
}

variable "ssh_public_key" {
  description = "The public half of the SSH key the chapter generated (the private half never leaves the work folder)"
  type        = string
}

variable "api_from_world" {
  description = "true opens TCP 6443 (the Kubernetes API server) to the whole internet; false (default) keeps it reachable only between the two machines"
  type        = bool
  default     = false
}

locals {
  prefix = startswith(var.key, "kubebook-") ? var.key : "kubebook-${var.key}"
  tags   = { kubebook = var.key }
  nodes  = toset(["cp", "worker"])
}

# Each machine's SSH host key, generated here and installed by the first-boot script, so a chapter verifies the host
# key from the outputs (out of band) instead of trusting the first thing that answers on port 22.
resource "tls_private_key" "host" {
  for_each  = local.nodes
  algorithm = "ED25519"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = local.tags
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "vm" {
  key_name   = "${local.prefix}-vm2-key"
  public_key = var.ssh_public_key
}

resource "aws_security_group" "vm" {
  name        = "${local.prefix}-vm2-sg"
  description = "Two-node Kubernetes lab of the Kubernetes book: all traffic inside the group, SSH from the world"
  vpc_id      = data.aws_vpc.default.id

  # every member of the group may talk to every other member on any protocol and port (6443, 10250, 2379-2380, CNI tunnels ...)
  ingress {
    description = "all traffic between the two machines"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }
  ingress {
    description = "ssh from the world"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = var.api_from_world ? [1] : []
    content {
      description = "Kubernetes API server from the world"
      from_port   = 6443
      to_port     = 6443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vm" {
  for_each                    = local.nodes
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.vm.id]
  key_name                    = aws_key_pair.vm.key_name
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = templatefile("${path.module}/../cloud-init.sh.tftpl", { host_key_private = tls_private_key.host[each.key].private_key_openssh, host_key_public = trimspace(tls_private_key.host[each.key].public_key_openssh) })
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }
  # the root volume carries the tag too, so the sweep finds it even if it outlives the instance
  volume_tags = local.tags
  tags        = { Name = "${local.prefix}-${each.key}" }
}

output "cp_public_ip" {
  value = aws_instance.vm["cp"].public_ip
}

output "cp_private_ip" {
  value = aws_instance.vm["cp"].private_ip
}

output "worker_public_ip" {
  value = aws_instance.vm["worker"].public_ip
}

output "worker_private_ip" {
  value = aws_instance.vm["worker"].private_ip
}

output "ssh_user" {
  value = "ubuntu"
}

output "cp_host_key" {
  value = trimspace(tls_private_key.host["cp"].public_key_openssh)
}

output "worker_host_key" {
  value = trimspace(tls_private_key.host["worker"].public_key_openssh)
}
