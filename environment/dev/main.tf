module "resource-group" {
  source = "../../module/resourcegroup"

  resource_groups = var.resource_groups
}

module "vnet" {
  source = "../../module/virtualnetwork"

  vnets      = var.vnets
  depends_on = [module.resource-group]
}

module "subnet" {
  source = "../../module/subnet"

  subnets    = var.subnets
  depends_on = [module.vnet]
}

module "network-interface" {
  source = "../../module/networkinterface"

  network_interfaces = {
    for key, nic in var.network_interfaces : key => {
      name                = nic.name
      location            = nic.location
      resource_group_name = nic.resource_group_name
      subnet_id           = module.subnet.subnet_ids[nic.subnet_id]
    }
  }

  depends_on = [module.subnet]
}

module "vm" {
  source = "../../module/virtualmachine"

  vms = {
    for key, vm in var.vms : key => {
      name                 = vm.name
      resource_group_name  = vm.resource_group_name
      location             = vm.location
      size                 = vm.size
      network_interface_id = module.network-interface.nic_ids[vm.network_interface_id]
    }
  }

  admin_username = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value

  depends_on = [module.network-interface]
}