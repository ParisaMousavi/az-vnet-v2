resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}

resource "azurerm_subnet" "this" {
  for_each             = var.subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints

  enforce_private_link_service_network_policies  = each.value.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies

  dynamic "delegation" {
    for_each = each.value.delegations

    content {
      name = delegation.key
      service_delegation {
        name    = delegation.value.name
        actions = delegation.value.actions
      }
    }
  }
}
