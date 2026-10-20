output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.nic-block :
    key => nic.id
  }
}