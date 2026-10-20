data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm-pasword"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# data "azurerm_subnet" "subnet" {
#   for_each             = var.subnets
#   name                 = each.value.name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.resource_group_name

#   depends_on = [module.subnet]
# }