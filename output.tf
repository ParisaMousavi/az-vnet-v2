output "id" {
  value = azurerm_virtual_network.this.id
}

output "name" {
  value = azurerm_virtual_network.this.name
}

output "location" {
  value = azurerm_virtual_network.this.location
}

output "rg_name" {
  value = azurerm_virtual_network.this.resource_group_name
}

output "address_space" {
  value = azurerm_virtual_network.this.address_space
}

output "dns_servers" {
  value = azurerm_virtual_network.this.dns_servers
}

output "subnets" {
  value = {
    for subnet in keys(azurerm_subnet.this) : subnet => {
      id               = azurerm_subnet.this[subnet].id
      address_prefixes = azurerm_subnet.this[subnet].address_prefixes
    }
  }
}
