output "id" {
  value = azurerm_virtual_network.vnet.id
}

output "name" {
  value = azurerm_virtual_network.vnet.name
}

output "location" {
  value = azurerm_virtual_network.vnet.location
}

output "rg_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "dns_servers" {
  value = azurerm_virtual_network.vnet.dns_servers
}

output "subnets" {
  value = {
    for subnet in keys(azurerm_subnet.subnets) : subnet => {
      id               = azurerm_subnet.subnets[subnet].id
      address_prefixes = azurerm_subnet.subnets[subnet].address_prefixes
    }
  }
}
