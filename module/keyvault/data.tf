data "azurerm_key_vault" "kv" {
  name                = "YOUR-KEYVAULT-NAME"
  resource_group_name = "YOUR-RESOURCE-GROUP"
}

data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm-pasword"
  key_vault_id = data.azurerm_key_vault.kv.id
}

