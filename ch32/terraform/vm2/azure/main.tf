# TARGET vm2 / Azure: two Ubuntu 24.04 virtual machines (<prefix>-cp and <prefix>-worker, Standard_D2s_v7: 2 vCPU, 8 GB,
# 30 GB disk) in ONE resource group <prefix>-rg, on one virtual network and one subnet. One network security group on
# both NICs: all traffic from the subnet, SSH (22) from the world, the API server (6443) from the world only when
# api_from_world is true; outbound stays at the Azure default (allow). Each machine has its own Standard static public IP.
# Quota: a free trial subscription allows 4 vCPUs per region, and two D2s_v7 are exactly 4, so NOTHING else may run in the
# same region meanwhile. eastus2 is the default (location variable); centralus is the measured alternative (2026-09-17).
# The OS is stock Ubuntu: cloud-init installs only the SSH host key (generated here, one per machine, printed by the
# cp_host_key and worker_host_key outputs; a chapter builds its known_hosts line from them, never from ssh-keyscan).
terraform {
  required_version = ">= 1.15.0"
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 4.0" }
    tls     = { source = "hashicorp/tls", version = "~> 4.0" }
  }
}

variable "key" {
  description = "The book's key for this run (chNN for a chapter); every resource is tagged kubebook=<key> and named kubebook-<key>-..."
  type        = string
}

variable "location" {
  description = "The Azure region (default eastus2; centralus is the alternative if eastus2 has no capacity); the subscription allows 4 vCPUs per region, and these two machines use all 4"
  type        = string
  default     = "eastus2"
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
  prefix   = startswith(var.key, "kubebook-") ? var.key : "kubebook-${var.key}"
  tags     = { kubebook = var.key }
  location = var.location
  nodes    = toset(["cp", "worker"])
  subnet   = "10.10.1.0/24"
}

# Each machine's SSH host key, generated here and installed by the first-boot script, so a chapter verifies the host
# key from the outputs (out of band) instead of trusting the first thing that answers on port 22.
resource "tls_private_key" "host" {
  for_each  = local.nodes
  algorithm = "ED25519"
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "vm" {
  name     = "${local.prefix}-rg"
  location = local.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "vm" {
  name                = "${local.prefix}-vnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.vm.name
  address_space       = ["10.10.0.0/16"]
  tags                = local.tags
}

resource "azurerm_subnet" "vm" {
  name                 = "${local.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.vm.name
  virtual_network_name = azurerm_virtual_network.vm.name
  address_prefixes     = [local.subnet]
}

resource "azurerm_public_ip" "vm" {
  for_each            = local.nodes
  name                = "${local.prefix}-${each.key}-ip"
  location            = local.location
  resource_group_name = azurerm_resource_group.vm.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags
}

resource "azurerm_network_security_group" "vm" {
  name                = "${local.prefix}-nsg"
  location            = local.location
  resource_group_name = azurerm_resource_group.vm.name
  tags                = local.tags

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # any protocol, any port, from the subnet (the Azure default VNet rule says the same; written out so the lab does not depend on it)
  security_rule {
    name                       = "subnet-all"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = local.subnet
    destination_address_prefix = "*"
  }
  dynamic "security_rule" {
    for_each = var.api_from_world ? [1] : []
    content {
      name                       = "api"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "6443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_network_interface" "vm" {
  for_each              = local.nodes
  name                  = "${local.prefix}-${each.key}-nic"
  location              = local.location
  resource_group_name   = azurerm_resource_group.vm.name
  ip_forwarding_enabled = true # a CNI may route pod traffic through a node
  tags                  = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm[each.key].id
  }
}

resource "azurerm_network_interface_security_group_association" "vm" {
  for_each                  = local.nodes
  network_interface_id      = azurerm_network_interface.vm[each.key].id
  network_security_group_id = azurerm_network_security_group.vm.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = local.nodes
  name                  = "${local.prefix}-${each.key}"
  location              = local.location
  resource_group_name   = azurerm_resource_group.vm.name
  size                  = "Standard_D2s_v7"
  admin_username        = "ubuntu"
  network_interface_ids = [azurerm_network_interface.vm[each.key].id]
  custom_data           = base64encode(templatefile("${path.module}/../cloud-init.sh.tftpl", { host_key_private = tls_private_key.host[each.key].private_key_openssh, host_key_public = trimspace(tls_private_key.host[each.key].public_key_openssh) }))
  tags                  = local.tags

  admin_ssh_key {
    username   = "ubuntu"
    public_key = var.ssh_public_key
  }
  os_disk {
    name                 = "${local.prefix}-${each.key}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

output "cp_public_ip" {
  value = azurerm_public_ip.vm["cp"].ip_address
}

output "cp_private_ip" {
  value = azurerm_network_interface.vm["cp"].private_ip_address
}

output "worker_public_ip" {
  value = azurerm_public_ip.vm["worker"].ip_address
}

output "worker_private_ip" {
  value = azurerm_network_interface.vm["worker"].private_ip_address
}

output "ssh_user" {
  value = "ubuntu"
}

output "resource_group" {
  value = azurerm_resource_group.vm.name
}

output "cp_host_key" {
  value = trimspace(tls_private_key.host["cp"].public_key_openssh)
}

output "worker_host_key" {
  value = trimspace(tls_private_key.host["worker"].public_key_openssh)
}
