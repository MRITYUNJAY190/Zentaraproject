variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_interfaces" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = string
  }))
}

variable "vms" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    network_interface_id = string
  }))
}

variable "key_vault_name" {
  type = string
}

variable "key_vault_resource_group" {
  type = string
}