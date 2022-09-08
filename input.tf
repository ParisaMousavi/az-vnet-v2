variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type    = list(string)
  default = []
}

variable "subnets" {
  type = map(
    object({
      address_prefixes                               = list(string)
      service_endpoints                              = list(string)
      enforce_private_link_service_network_policies  = bool
      enforce_private_link_endpoint_network_policies = bool
      delegations = map(
        object({
          name    = string
          actions = list(string)
        })
      )
    })
  )
  default = {}
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}
