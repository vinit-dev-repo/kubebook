# TARGET vm2 / Google Cloud: two Ubuntu 24.04 Compute Engine instances (<prefix>-cp and <prefix>-worker, e2-medium: 2 vCPU,
# 4 GB, 30 GB pd-balanced) in us-central1-a on their OWN VPC network and one subnet (10.10.1.0/24). Firewall: all
# protocols and ports from the subnet, SSH (22) from the world, the API server (6443) from the world only when
# api_from_world is true; egress stays at the implied allow. can_ip_forward is on (a CNI may route pod traffic).
# A network, a subnetwork and a firewall rule take no label, so each carries the description "kubebook=<key>" and the
# name prefix; cloud_sweep.py matches those two together, never the name alone.
# The OS is stock Ubuntu: the startup script installs only the SSH host key (generated here, one per machine, printed by
# the cp_host_key and worker_host_key outputs; a chapter builds its known_hosts line from them, never from ssh-keyscan).
terraform {
  required_version = ">= 1.15.0"
  required_providers {
    google = { source = "hashicorp/google", version = "~> 7.0" }
    tls    = { source = "hashicorp/tls", version = "~> 4.0" }
  }
}

variable "key" {
  description = "The book's key for this run (chNN for a chapter); every resource is labelled kubebook=<key> and named kubebook-<key>-..."
  type        = string
}

variable "ssh_public_key" {
  description = "The public half of the SSH key the chapter generated"
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
  desc   = "kubebook=${var.key}"
  nodes  = toset(["cp", "worker"])
  subnet = "10.10.1.0/24"
}

# Each machine's SSH host key, generated here and installed by the startup script, so a chapter verifies the host
# key from the outputs (out of band) instead of trusting the first thing that answers on port 22.
resource "tls_private_key" "host" {
  for_each  = local.nodes
  algorithm = "ED25519"
}

# the project comes from the environment variable GOOGLE_CLOUD_PROJECT, so each reader uses their own
provider "google" {
  region         = "us-central1"
  zone           = "us-central1-a"
  default_labels = local.tags
}

resource "google_compute_network" "vm" {
  name                    = "${local.prefix}-net"
  description             = local.desc
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vm" {
  name          = "${local.prefix}-subnet"
  description   = local.desc
  region        = "us-central1"
  network       = google_compute_network.vm.id
  ip_cidr_range = local.subnet
}

resource "google_compute_firewall" "internal" {
  name          = "${local.prefix}-internal"
  description   = local.desc
  network       = google_compute_network.vm.name
  source_ranges = [local.subnet]
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "ssh" {
  name          = "${local.prefix}-ssh"
  description   = local.desc
  network       = google_compute_network.vm.name
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${local.prefix}-node"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "api" {
  count         = var.api_from_world ? 1 : 0
  name          = "${local.prefix}-api"
  description   = local.desc
  network       = google_compute_network.vm.name
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${local.prefix}-node"]
  allow {
    protocol = "tcp"
    ports    = ["6443"]
  }
}

resource "google_compute_instance" "vm" {
  for_each       = local.nodes
  name           = "${local.prefix}-${each.key}"
  machine_type   = "e2-medium"
  zone           = "us-central1-a"
  tags           = ["${local.prefix}-node"]
  can_ip_forward = true

  boot_disk {
    initialize_params {
      image  = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size   = 30
      type   = "pd-balanced"
      labels = local.tags
    }
  }
  network_interface {
    network    = google_compute_network.vm.id
    subnetwork = google_compute_subnetwork.vm.id
    access_config {}
  }
  metadata = {
    ssh-keys       = "ubuntu:${var.ssh_public_key}"
    startup-script = templatefile("${path.module}/../cloud-init.sh.tftpl", { host_key_private = tls_private_key.host[each.key].private_key_openssh, host_key_public = trimspace(tls_private_key.host[each.key].public_key_openssh) })
  }
}

output "cp_public_ip" {
  value = google_compute_instance.vm["cp"].network_interface[0].access_config[0].nat_ip
}

output "cp_private_ip" {
  value = google_compute_instance.vm["cp"].network_interface[0].network_ip
}

output "worker_public_ip" {
  value = google_compute_instance.vm["worker"].network_interface[0].access_config[0].nat_ip
}

output "worker_private_ip" {
  value = google_compute_instance.vm["worker"].network_interface[0].network_ip
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
