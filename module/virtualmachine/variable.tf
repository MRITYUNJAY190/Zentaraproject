variable "vms" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    network_interface_id = string
  }))
}

variable "admin_username" {
  type      = string
  sensitive = true
}

variable "admin_password" {
  type      = string
  sensitive = true
}